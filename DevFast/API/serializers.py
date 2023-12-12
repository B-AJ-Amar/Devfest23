from .models import  Costumer , Progress  , Peyment , DataReq ,  Notification , DataRes
from rest_framework import serializers
 

class CostumerSerializer(serializers.ModelSerializer):
    class Meta:
        model = Costumer
        fields = "__all__"


class ProgressSerializer(serializers.ModelSerializer):
    class Meta:
        model = Progress 
        fields = "__all__"

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

 