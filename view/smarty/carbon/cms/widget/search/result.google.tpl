<div class="block {if isset($app['cms']['properties'])}{$app['cms']['properties']->getWidgetProperty('style.container')}{/if}" {if (isset($app['cms']['widget']))}id="widget-{$app.cms.widget}"{/if}>
    <script>
        (function() {
            var cx = '{$clientId}';
            var gcse = document.createElement('script');
            gcse.type = 'text/javascript';
            gcse.async = true;
            gcse.src = (document.location.protocol == 'https:' ? 'https:' : 'http:') +
                    '//www.google.com/cse/cse.js?cx=' + cx;
            var s = document.getElementsByTagName('script')[0];
            s.parentNode.insertBefore(gcse, s);
        })();
    </script>
    <gcse:searchresults-only lr="lang_{$app.locale}"></gcse:searchresults-only>
</div>
