from django.db import models
from django.contrib.auth.models import User
import os
from django.utils import timezone
# from time import time.time

# Create your models here.
class Costumer(models.Model):
    user = models.OneToOneField(User, null=True, blank=True, on_delete=models.CASCADE)
    phone = models.CharField(max_length=15, null=True,blank=True)
    is_delivered = models.BooleanField(default=False)
    delivery_date = models.DateTimeField(default=None, null=True, blank=True)
    # address = models.CharField(max_length=100)
    # city = models.CharField(max_length=50)
    # state = models.CharField(max_length=50)
    # zipcode = models.CharField(max_length=10)
    # date_created = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f'{self.user.first_name} {self.user.last_name}'


def get_progress_image_path(instance, filename):
    return os.path.join(f'costumer-{instance.costumer.id}', f'prog-{instance.id}', str(filename))

class Progress(models.Model):
    costumer = models.ForeignKey(Costumer, null=True, on_delete=models.SET_NULL,related_name='customer')
    img = models.ImageField(upload_to=get_progress_image_path, null=True, blank=True)
    date = models.DateTimeField(default=timezone.now,null=True, blank=True)
    description = models.TextField(null=True,blank=True)
    
    
class Peyment(models.Model):
    costumer = models.ForeignKey(Costumer, null=True, on_delete=models.SET_NULL)
    price = models.DecimalField(max_digits=15,decimal_places=2)
    is_paid = models.BooleanField(default=False)
    date = models.DateTimeField(default=timezone.now,null=True, blank=True)
    
    
class DataReq(models.Model):
    costumer = models.ForeignKey(Costumer, null=True, on_delete=models.SET_NULL)
    date = models.DateTimeField(default=timezone.now,null=True, blank=True)
    text = models.TextField(null=True,blank=True)
    is_finished = models.BooleanField(default=False)


def get_datares_file_path(instance, filename):
    return os.path.join(f'costumer-{instance.costumer.id}', f'req-{instance.id}', str(filename))

class DataRes(models.Model):
    
    img = models.ImageField(upload_to=get_datares_file_path, null=True, blank=True)
    datareq = models.ForeignKey(DataReq, null=True, on_delete=models.SET_NULL)
    date = models.DateTimeField(default=timezone.now,null=True, blank=True)
    

class Notification(models.Model):
    INPUT_CHOICES = (
            ('peyment', 'peyment'),
            ('progress', 'progress'),
            ('request','request'),
        )
    costumer = models.ForeignKey(Costumer, null=True, on_delete=models.SET_NULL)
    type = models.CharField(choices=INPUT_CHOICES, max_length=10)
    