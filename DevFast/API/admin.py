from django.contrib import admin
from API.models import *
# Register your models here.



class CostumerAdmin(admin.ModelAdmin):
   list_display = ("user", "phone","is_delivered", "delivery_date",)
 
admin.site.register(Costumer, CostumerAdmin)
# =====================================================================
class ProgressAdmin(admin.ModelAdmin):
   list_display = ("costumer", "url","date", "description")
 
admin.site.register(Progress,ProgressAdmin)
# =====================================================================
class PeymentAdmin(admin.ModelAdmin):
   list_display = ("costumer", "price","is_paid", "date")
   
admin.site.register(Peyment,PeymentAdmin)
# =====================================================================
class DataReqAdmin(admin.ModelAdmin):
   list_display = ("costumer", "date","text", "is_finished")
   
admin.site.register(DataReq,DataReqAdmin)
# =====================================================================
class DataResAdmin(admin.ModelAdmin):
   list_display = ("img", "datareq","date")
   
admin.site.register(DataRes)
# =====================================================================
class NotificationAdmin(admin.ModelAdmin):
   list_display = ("INPUT_CHOICES", "costumer","type")
   

admin.site.register(Notification)