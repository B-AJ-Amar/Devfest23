from .models import  Costumer , Progress  , Peyment , DataReq ,  Notification , DataRes , Teckit , Post 
from rest_framework import serializers
 

class CostumerSerializer(serializers.ModelSerializer):
    class Meta:
        model = Costumer
        fields = "__all__"


class ProgressSerializer(serializers.ModelSerializer):
    date = serializers.DateTimeField(format="%Y-%m-%d %H:%M:%S")
    class Meta:
        model = Progress 
        fields = "__all__"

class PeymentSerializer(serializers.ModelSerializer):
    date = serializers.DateTimeField(format="%Y-%m-%d %H:%M:%S")
    class Meta:
        model = Peyment 
        fields = "__all__"


class DataReqSerializer(serializers.ModelSerializer):
    date = serializers.DateTimeField(format="%Y-%m-%d %H:%M:%S")
    class Meta: 
        model = DataReq 
        fields = "__all__"

class DataResSerializer(serializers.ModelSerializer):
    date = serializers.DateTimeField(format="%Y-%m-%d %H:%M:%S")
    class Meta: 
        model = DataRes 
        fields = "__all__"

class NotificationSerializer(serializers.ModelSerializer):
    date = serializers.DateTimeField(format="%Y-%m-%d %H:%M:%S")
    class Meta: 
        model = Notification 
        fields = "__all__"

class TeckitSerializer(serializers.ModelSerializer):
    date = serializers.DateTimeField(format="%Y-%m-%d %H:%M:%S")
    class Meta: 
        model = Teckit 
        fields = "__all__"
class PostSerializer(serializers.ModelSerializer):
    date = serializers.DateTimeField(format="%Y-%m-%d %H:%M:%S")
    class Meta: 
        model = Post 
        fields = "__all__"



 