{% load url from future %}

var urlRoot = '{{ request.META.SCRIPT_NAME }}';
if (urlRoot.charAt(urlRoot.length-1) !== '/') {
    urlRoot = urlRoot + '/';
}

var csrf_token = '{{ csrf_token }}',

    require = {
        baseUrl: '{{ STATIC_URL }}cilantro/js',
        paths: {
            'project': '{{ JAVASCRIPT_URL }}'
        },
        config: {
            tpl: {
                variable: 'data'
            }
        }
    },  

    cilantro = {
        root: '{{ request.META.SCRIPT_NAME }}',
        url: '{% url "serrano:root" %}',
        autoload: true,
        main: '#content'
    };

