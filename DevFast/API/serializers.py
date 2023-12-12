from .models import  Costumer , Progress  , Peyment , DataReq ,  Notification , DataRes
from rest_framework import serializers
from backend.settings import base_url


class CostumerSerializer(serializers.ModelSerializer):
    class Meta:
        model = Costumer
        fields = "__all__"


class ProgressSerializer(serializers.ModelSerializer):
    date = serializers.DateTimeField(format="%Y-%m-%d %H:%M:%S")
    url = serializers.SerializerMethodField()
    class Meta:
        model = Progress 
        fields = "__all__"
        
    def get_url(self, obj):
        # Assuming your Django app is running on the same machine on port 8000
        # Adjust the URL accordingly based on your setup
        
        return f"{base_url}/media/{obj.url}" if obj.url else None

class PeymentSerializer(serializers.ModelSerializer):
    class Meta:
        model = Peyment 
        fields = "__all__"

class PeymentSerializer(serializers.ModelSerializer):
    class Meta:
        model = Peyment 
        fields = "__all__"

class DataReqSerializer(serializers.ModelSerializer):
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

 