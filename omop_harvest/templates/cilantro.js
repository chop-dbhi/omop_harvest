var csrf_token = '{{ csrf_token }}',

    require = {
        baseUrl: '{{ STATIC_URL }}cilantro/js',
        paths: {
            'project': '{{ JAVASCRIPT_URL }}'
        }
    },

    cilantro = {
        url: '{% url "serrano:root" %}',
        root: '{{ request.META.SCRIPT_NAME }}',
        main: '#content'
    };
