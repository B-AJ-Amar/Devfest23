from django.shortcuts import render
from django.http import JsonResponse
from rest_framework.generics import ListAPIView, RetrieveAPIView, CreateAPIView, UpdateAPIView, DestroyAPIView
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework.parsers import MultiPartParser, FormParser
from .models import Progress
from .serializers import ProgressSerializer
from rest_framework import status

class GetTheProgress(APIView):
    def get(self, request ):
        if request.user.is_authenticated:
            objects = Progress.objects.filter(customer=request.user.customer)
            serializer = ProgressSerializer(objects, many=True)
            serialized_data = serializer.data
            return Response({'progress': serialized_data})
        else:
            return Response({'error': 'User not authenticated'}, status=status.HTTP_401_UNAUTHORIZED)


class hello(APIView):
    def get(self,request):
        return JsonResponse({"message":"Hello World"})
    
# class Send