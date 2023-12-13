from django.db import models
from django.contrib.auth.models import User
import os
from django.utils import timezone
from PIL import Image
import os,shutil
# from time import time.time

# Create your models here.
class Costumer(models.Model):
    user = models.OneToOneField(User, null=True, blank=True, on_delete=models.CASCADE)
    phone = models.CharField(max_length=15, null=True,blank=True)
    is_delivered = models.BooleanField(default=False)
    delivery_date = models.DateTimeField(default=None, null=True, blank=True)
    total_price = models.DecimalField(max_digits=15,decimal_places=2,default=0)
    # address = models.CharField(max_length=100)
    # city = models.CharField(max_length=50)
    # state = models.CharField(max_length=50)
    # zipcode = models.CharField(max_length=10)
    # date_created = models.DateTimeField(auto_now_add=True)
    def rest_price(self):
        pps = Peyment.objects.filter(costumer=self.id)
        total = self.total_price
        for pp in pps:
            if pp.is_paid:
                total -= pp.price
        return total 
    def __str__(self):
        return self.user.username
class Notification(models.Model):
 
    costumer = models.ForeignKey(Costumer, null=True, on_delete=models.SET_NULL)
    title = models.CharField(max_length=50,default="No Title",null=True,blank=True)
    description = models.TextField(null=True,blank=True)
    type = models.IntegerField(default=0)
    is_reded = models.BooleanField(default=False)
    
    
    def __str__(self):
        return f'{self.costumer} {self.type}'


def get_progress_image_path(instance, filename):
    return os.path.join(f'costumer-{instance.costumer.id}', f'prog-{instance.id}', str(filename))

class Progress(models.Model):
    costumer = models.ForeignKey(Costumer, null=True, on_delete=models.SET_NULL,related_name='customer')
    url = models.ImageField(upload_to=get_progress_image_path,default="default.jpg", null=True, blank=True)
    date = models.DateTimeField(default=timezone.now,null=True, blank=True)
    description = models.TextField(null=True,blank=True)
    notification = models.ForeignKey(Notification, null=True,blank=True, on_delete=models.SET_NULL)
    def save(self, *args, **kwargs):
        super().save(*args, **kwargs)
        INPUT_CHOICES = ( 'progress', 'peyment','request')
        
        if self.notification == None:
            note = Notification.objects.create(costumer=self.costumer,description=self.description,type=0,title=INPUT_CHOICES[0])
            note.save()
            self.notification = note
            self.save()
        # if change:
            
    
class Peyment(models.Model):
    costumer = models.ForeignKey(Costumer, null=True, on_delete=models.SET_NULL)
    price = models.DecimalField(max_digits=15,decimal_places=2)
    is_paid = models.BooleanField(default=False)
    date = models.DateTimeField(default=timezone.now,null=True, blank=True)
    notification = models.ForeignKey(Notification, null=True,blank=True, on_delete=models.SET_NULL)
    def save(self, *args, **kwargs):
        super().save(*args, **kwargs)
        INPUT_CHOICES = ( 'progress', 'peyment','request')
        
        if self.notification == None:
            note = Notification.objects.create(costumer=self.costumer,description=f"{self.price}",type=1,title=INPUT_CHOICES[1])
            note.save()
            self.notification = note
            self.save()
        # if change:
    
class DataReq(models.Model):
    costumer = models.ForeignKey(Costumer, null=True, on_delete=models.SET_NULL)
    date = models.DateTimeField(default=timezone.now,null=True, blank=True)
    text = models.TextField(null=True,blank=True)
    is_finished = models.BooleanField(default=False)
    notification = models.ForeignKey(Notification, null=True,blank=True, on_delete=models.SET_NULL)
    def save(self, *args, **kwargs):
        super().save(*args, **kwargs)
        INPUT_CHOICES = ( 'progress', 'peyment','request')
        
        if self.notification == None:
            note = Notification.objects.create(costumer=self.costumer,description=self.text,type=2,title=INPUT_CHOICES[2])
            note.save()
            self.notification = note
            self.save()
        # if change:

def get_datares_file_path(instance, filename):
    return os.path.join(f'costumer-{instance.costumer.id}', f'req-{instance.id}', str(filename))

class DataRes(models.Model):
    
    url = models.ImageField(upload_to=get_datares_file_path, null=True, blank=True)
    datareq = models.ForeignKey(DataReq, null=True, on_delete=models.SET_NULL)
    date = models.DateTimeField(default=timezone.now,null=True, blank=True)



class Teckit(models.Model):
    """
    repost to fix any problems within the apartement 
    """ 
    costumer = models.ForeignKey(Costumer, null=True, on_delete=models.SET_NULL)
    Type = models.CharField(max_length=30) 
    title = models.CharField(max_length=30,default="No Title")
    text = models.TextField()
    date = models.DateTimeField(default=timezone.now,null=True, blank=True)



class PostType(models.Model):
    """
    repost to fix any problems within the apartement 
    """ 
    name = models.CharField(max_length=30) 
    def __str__(self):
        return self.name

class Post(models.Model):
    """
    repost to fix any problems within the apartement 
    """ 
    costumer = models.ForeignKey(Costumer, null=True, on_delete=models.SET_NULL)
    type = models.ForeignKey(PostType, null=True, on_delete=models.SET_NULL)
    text = models.TextField()
    date = models.DateTimeField(default=timezone.now,null=True, blank=True)
