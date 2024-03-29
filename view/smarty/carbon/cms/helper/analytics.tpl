
{*
    # Function that returns the Google Tag Manager tag in <head>
 *}
{function googleTagManagerHead id=false}
    {if !$id && isset($app['cms']['node'])}
        {$id = $app['cms']['node']->getLocalized($app['locale'], 'analytics.gtm_id')}
        {if !$id && isset($app['system'])}
            {$id = $app['system']->getConfig()->get('google.tagmanager.id')}
        {/if}
    {/if}
    {if $id}
        {$gtmCount = {counter}}
        {if $gtmCount < 2}
            <!-- Google Tag Manager -->
            <script>(function(w,d,s,l,i){ldelim}w[l]=w[l]||[];w[l].push({ldelim}'gtm.start':
            new Date().getTime(),event:'gtm.js'{rdelim});var f=d.getElementsByTagName(s)[0],
            j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
            'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
            {rdelim})(window,document,'script','dataLayer','{$id}');</script>
            <!-- End Google Tag Manager -->
        {/if}
    {/if}
{/function}

{*
    # Function that returns the Google Tag Manager tag in <body>
 *}
{function googleTagManagerBody id=false}
    {if !$id && isset($app['cms']['node'])}
        {$id = $app['cms']['node']->getLocalized($app['locale'], 'analytics.gtm_id')}
        {if !$id && isset($app['system'])}
            {$id = $app['system']->getConfig()->get('google.tagmanager.id')}
        {/if}
    {/if}
    {if $id}
        {$gtmCount = {counter}}
        {if $gtmCount < 3}
            <!-- Google Tag Manager (noscript) -->
            <noscript><iframe src="https://www.googletagmanager.com/ns.html?id={$id}"
            height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
            <!-- End Google Tag Manager (noscript) -->
        {/if}
    {/if}
{/function}

{*
 * Function to return the Universal Analytics tag
 *}
{function googleAnalytics id=false}
    {if !$id && isset($app['cms']['node'])}
        {$id = $app['cms']['node']->getLocalized($app['locale'], 'analytics.ga_id')}
        {if !$id && isset($app['system'])}
            {$id = $app['system']->getConfig()->get('google.analytics.id')}
        {/if}
    {/if}

    {if $id}
        <script>
            (function(i,s,o,g,r,a,m){ldelim}i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){ldelim}
                        (i[r].q=i[r].q||[]).push(arguments){rdelim},i[r].l=1*new Date();a=s.createElement(o),
                    m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
                {rdelim})(window,document,'script','//www.google-analytics.com/analytics.js','ga');
            ga('create', '{$id}', 'auto');
            ga('send', 'pageview');
        </script>
    {/if}
{/function}
