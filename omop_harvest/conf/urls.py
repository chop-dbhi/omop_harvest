import re
from django.conf.urls import url, patterns, include
from django.conf import settings
from django.contrib import admin
from django.views.generic import TemplateView
from django.template import add_to_builtins

add_to_builtins('avocado.templatetags.avocado_tags')

admin.autodiscover()

urlpatterns = patterns('',
    # Landing Page
    url(r'^$', 'omop_harvest.views.landing', name='landing'),

    # Cilantro Pages
    url(r'^workspace/', TemplateView.as_view(template_name='index.html'), name='workspace'),
    url(r'^query/', TemplateView.as_view(template_name='index.html'), name='query'),
    url(r'^results/', TemplateView.as_view(template_name='index.html'), name='results'),

    # Serrano-compatible Endpoint
    url(r'^api/', include('serrano.urls')),

    # Administrative components
    url(r'^admin/', include(admin.site.urls)),

    #CHOPAuth URLs
    url(r'^register/$', 'registration.views.register',{'template_name':'registration.html'},name='register'),
    url(r'^register/complete/$', TemplateView.as_view(template_name='registration_complete.html'),
        name='registration-complete'),
    url(r'^login/$', 'django.contrib.auth.views.login', {'template_name':'login.html'}, name='login'),
    
    url(r'^', include('chopauth.urls')),
)

# In production, these two locations must be served up statically
urlpatterns += patterns('django.views.static',
    url(r'^{0}(?P<path>.*)$'.format(re.escape(settings.MEDIA_URL.lstrip('/'))), 'serve', {
        'document_root': settings.MEDIA_ROOT
    }),
    url(r'^{0}(?P<path>.*)$'.format(re.escape(settings.STATIC_URL.lstrip('/'))), 'serve', {
        'document_root': settings.STATIC_ROOT
    }),
)
