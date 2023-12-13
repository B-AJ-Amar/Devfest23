from django.shortcuts import render
from django.http import JsonResponse
from rest_framework.generics import ListAPIView, RetrieveAPIView, CreateAPIView, UpdateAPIView, DestroyAPIView
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework.parsers import MultiPartParser, FormParser
from .models import *
from .serializers import *
from rest_framework import status


from rest_framework.permissions import IsAuthenticated
from rest_framework.authentication import SessionAuthentication,BasicAuthentication,TokenAuthentication
from rest_framework.decorators import authentication_classes,permission_classes

class GetTheProgress(APIView):
    # ? tsawer ta3 dare bah sayed yefrah b darou 
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



class GetTheReq(APIView): 
    # ? hna neb3atlou wach nahtag (aka rewy ta3 lwra9i)
    authentication_classes = [TokenAuthentication,SessionAuthentication]
    permission_classes = [IsAuthenticated] 
    def get(self, request ):
        if request.user.is_authenticated:
            try:
                costumer_id = Costumer.objects.get(user=request.user).id
            except Exception as e:
                print("ProgressView error : ",e)
                return Response({'error': "not found"},status=404)
                
            objects = DataReq.objects.filter(costumer=costumer_id)
            serializer = DataReqSerializer(objects, many=True)
            serialized_data = serializer.data
            return Response({'date': serialized_data})
        else:
            return Response({'error': 'User not authenticated'}, status=status.HTTP_401_UNAUTHORIZED)


class SendFile(APIView):
    # ?  hna hna njim nahtaj (aka rewy ta3 lwra9i)
    authentication_classes = [TokenAuthentication,SessionAuthentication]
    permission_classes = [IsAuthenticated] 
    def post(self, request ):
        if request.user.is_authenticated:
            serializer = DataResSerializer(data=request.data)
            if serializer.is_valid():
                # DataReq.objects.filter(datareq=serializer.datareq) = True ;
                serializer.save()

                return Response(status=status.HTTP_200_OK)
            else:
                return Response(status=status.HTTP_400_BAD_REQUEST)
        else:
            return Response({'error': 'User not authenticated'}, status=status.HTTP_401_UNAUTHORIZED)

class GetPymentDate(APIView): 
    # ?  hna neb3atlou bah y5alesni 🤑 
    authentication_classes = [TokenAuthentication,SessionAuthentication]
    permission_classes = [IsAuthenticated] 
    def get(self, request ):
        if request.user.is_authenticated:
            try:
                costumer_id = Costumer.objects.get(user=request.user).id
            except Exception as e:
                print("ProgressView error : ",e)
                return Response({'error': "not found"},status=404)
                
            objects = Peyment.objects.filter(costumer=costumer_id )
            serializer = PeymentSerializer(objects, many=True)
            serialized_data = serializer.data
            return Response({'data': serialized_data})
        else:
            return Response({'error': 'User not authenticated'}, status=status.HTTP_401_UNAUTHORIZED)

class NotificationView(ListAPIView):
    # ?  function returns a list of notifications for a authenticated user
    authentication_classes = [TokenAuthentication,SessionAuthentication]
    permission_classes = [IsAuthenticated] 
    serializer_class = NotificationSerializer
    def get_queryset(self):
        if self.request.user.is_authenticated:
            try:
                costumer_id = Costumer.objects.get(user=self.request.user).id
            except Exception as e:
                print("ProgressView error : ",e)
                return Response({'error': "not found"},status=404)
                
            objects = Notification.objects.filter(costumer=costumer_id)
            return objects
        else:
            return Response({'error': 'User not authenticated'}, status=status.HTTP_401_UNAUTHORIZED)

class NotificationPostView(APIView):
    # function for marking a notification as readed in the notification
    def post(self, request,id):
        if request.user.is_authenticated:
            try:
                notification = Notification.objects.get(id=id)
            except Exception as e:
                print("ProgressView error : ",e)
                return Response({'error': "not found"},status=404)
            notification.is_reded = True
            notification.save()
            return Response(status=status.HTTP_200_OK)
        else:
            return Response({'error': 'User not authenticated'}, status=status.HTTP_401_UNAUTHORIZED)
 
# class Send
class CostumerView(APIView):
    def get(self, request):
        if request.user.is_authenticated:
            try:
                costumer_id = Costumer.objects.get(user=request.user).id
            except Exception as e:
                print("ProgressView error : ",e)
                return Response({'error': "not found"},status=404)
                
            objects = Costumer.objects.get(id=costumer_id)
            serializer = CostumerSerializer(objects)
            serialized_data = serializer.data
            return Response({'data': serialized_data})
        else:
            return Response({'error': 'User not authenticated'}, status=status.HTTP_401_UNAUTHORIZED)
        
class SendPost(APIView): 
    # ?  hna ani neb3altou les post ta3 l3bat (idia : twiter-lite-lite) 
    authentication_classes = [TokenAuthentication,SessionAuthentication]
    permission_classes = [IsAuthenticated] 
    def post(self, request ):
        # ! todo : fix the complixity
        if request.user.is_authenticated:
            serializer = PostSerializer(data=request.data)
            if serializer.is_valid():
                serializer.save()

                return Response(status=status.HTTP_200_OK)
            else:
                return Response(status=status.HTTP_400_BAD_REQUEST)
        else:
            return Response({'error': 'User not authenticated'}, status=status.HTTP_401_UNAUTHORIZED)
    
            return Response({'error': 'User not authenticated'}, status=status.HTTP_401_UNAUTHORIZED)
class GetPost(APIView):
    # ?  function returns a list of notifications for a authenticated user
    authentication_classes = [TokenAuthentication,SessionAuthentication]
    permission_classes = [IsAuthenticated] 
    serializer_class = PostSerializer
    def get_(self, request,id):
        if request.user.is_authenticated:
            
            posts = Post.objects.filter(type=id)
            serializer = PostSerializer(posts, many=True)
            serialized_data = serializer.data
            return Response({'data': serialized_data})
                
        else:
            return Response({'error': 'User not authenticated'}, status=status.HTTP_401_UNAUTHORIZED)
class SendTeckit(APIView): 
    # ?  hna yeb3atly user lmachakel li 3andou  
    authentication_classes = [TokenAuthentication,SessionAuthentication]
    permission_classes = [IsAuthenticated] 
    def post(self, request ):
        # ! todo : fix the complixity
        if request.user.is_authenticated:
            serializer = TeckitSerializer(data=request.data)
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


class PostTypeView(ListAPIView):
    # ?  function returns a list of notifications for a authenticated user
    authentication_classes = [TokenAuthentication,SessionAuthentication]
    permission_classes = [IsAuthenticated] 
    serializer_class = PostTypeSerializer
    queryset = PostType.objects.all()
    
