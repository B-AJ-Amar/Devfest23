from .models import  Costumer , Progress  , Peyment , DataReq ,  Notification , DataRes , Teckit , Post, PostType
from rest_framework import serializers
from backend.settings import base_url
from django.contrib.auth.models import User

class Userserializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = "__all__"
        
class CostumerSerializer(serializers.ModelSerializer):
    user = serializers.SerializerMethodField()
    class Meta:
        model = Costumer
        fields = "__all__"
    def get_user(self, obj):
        return Userserializer(obj.user).data if obj.user else None


class ProgressSerializer(serializers.ModelSerializer):
    date = serializers.DateTimeField(format="%Y-%m-%d")
    url = serializers.SerializerMethodField()
    class Meta:
        model = Progress 
        fields = "__all__"
        
    def get_url(self, obj):
        # Assuming your Django app is running on the same machine on port 8000
        # Adjust the URL accordingly based on your setup
        
        return f"{base_url}/media/{obj.url}" if obj.url else None

class PeymentSerializer(serializers.ModelSerializer):
    date = serializers.DateTimeField(format="%Y-%m-%d")
    class Meta:
        model = Peyment 
        fields = "__all__"


class DataReqSerializer(serializers.ModelSerializer):
    date = serializers.DateTimeField(format="%Y-%m-%d")
    class Meta: 
        model = DataReq 
        fields = "__all__"

class DataResSerializer(serializers.ModelSerializer):
    class Meta: 
        model = DataRes 
        fields = "__all__"

class NotificationSerializer(serializers.ModelSerializer):
    class Meta: 
        model = Notification 
        fields = "__all__"

class TeckitSerializer(serializers.ModelSerializer):
    date = serializers.DateTimeField(format="%Y-%m-%d")
    class Meta: 
        model = Teckit 
        fields = "__all__"
class PostSerializer(serializers.ModelSerializer):
    date = serializers.DateTimeField(format="%Y-%m-%d")
    class Meta: 
        model = Post 
        fields = "__all__"
        
        
        
class PostTypeSerializer(serializers.ModelSerializer):
    class Meta: 
        model = PostType
        fields = "__all__"