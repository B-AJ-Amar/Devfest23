from django.shortcuts import render
from django.http import JsonResponse
from rest_framework.generics import ListAPIView, RetrieveAPIView, CreateAPIView, UpdateAPIView, DestroyAPIView
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework.parsers import MultiPartParser, FormParser
from .models import *
from .serializers import ProgressSerializer , DataResSerializer
from rest_framework import status


from rest_framework.permissions import IsAuthenticated
from rest_framework.authentication import SessionAuthentication,BasicAuthentication,TokenAuthentication
from rest_framework.decorators import authentication_classes,permission_classes

class GetTheProgress(APIView):
    authentication_classes = [TokenAuthentication,SessionAuthentication]
    permission_classes = [IsAuthenticated] 
    def get(self, request ):
        if request.user.is_authenticated:
            try:
                costumer_id = Costumer.objects.get(user=request.user).id
            except Exception as e:
                print("ProgressView error : ",e)
                return Response({'error': "not found"},status=404)
                
            objects = Progress.objects.filter(costumer=costumer_id)
            serializer = ProgressSerializer(objects, many=True)
            serialized_data = serializer.data
            return Response({'progress': serialized_data})
        else:
            return Response({'error': 'User not authenticated'}, status=status.HTTP_401_UNAUTHORIZED)


class SendFile(APIView):
    authentication_classes = [TokenAuthentication,SessionAuthentication]
    permission_classes = [IsAuthenticated] 
    def post(self, request ):
        if request.user.is_authenticated:
            serializer = DataResSerializer(data=request.data)
            if serializer.is_valid():
                serializer.save()
                return Response(status=status.HTTP_200_OK)
            else:
                return Response(status=status.HTTP_400_BAD_REQUEST)
        else:
            return Response({'error': 'User not authenticated'}, status=status.HTTP_401_UNAUTHORIZED)



 
class hello(APIView):
    def get(self,request):
        return JsonResponse({"message":"Hello World"})
    
# class Send