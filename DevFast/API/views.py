from django.shortcuts import render
from django.http import JsonResponse
from rest_framework.generics import ListAPIView, RetrieveAPIView, CreateAPIView, UpdateAPIView, DestroyAPIView
from rest_framework.response import Response
from rest_framework.views import APIView


class hello(APIView):
    def get(self,request):
        return JsonResponse({"message":"Hello World"})