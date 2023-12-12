from django.shortcuts import render
from django.http import JsonResponse
from rest_framework.generics import ListAPIView, RetrieveAPIView, CreateAPIView, UpdateAPIView, DestroyAPIView
from rest_framework.response import Response
from rest_framework.views import APIView
import os


class hello(APIView):
    def get(self,request):
        return JsonResponse({"message":"Hello World"})
    

def prg(request):
    data = {
    'date': '2023/12/03',
    'img': '/media/pro1.jpg' ,
    'desc': 'decs desc dddqsdqkfjhqfkjhs',
    }

    response = JsonResponse(data, status=200)
    return response