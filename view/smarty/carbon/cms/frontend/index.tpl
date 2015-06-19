{extends file="base/index"}

{if isset($app.cms.context)}
    {block "head_meta" append}
        {$meta = $app.cms.node->getMeta($app.locale)}
        {if $meta}
            {foreach $meta as $metaName => $metaValue}
                {if $metaName == 'og:image'}
                    <meta property="{$metaName}" content="{image src=$metaValue}" />
                {else}
                    <meta property="{$metaName}" content="{$metaValue|strip_tags|trim}" />
                {/if}
            {/foreach}
        {/if}
    {/block}

    {block "head_title"}{$app.cms.context.title.node} - {$app.cms.context.title.site}{/block}

    {block "body_attributes"} class="page-{$app.cms.node->getId()} {$app.cms.node->get('body.class')}" data-components="{$app.cms.node->get('body.components')}"{/block}
{/if}

{block "styles"}
    <!--[if gt IE 8]><!--><link rel="stylesheet" href="{$app.url.base}/css/main.min.css"><!--<![endif]-->
    <!--[if lt IE 9]><link rel="stylesheet" href="{$app.url.base}/css/main-legacy.min.css"><![endif]-->
{/block}

{block "scripts_head"}
    <script type="text/javascript" src="{$app.url.base}/js/modernizr.min.js"></script>
    <!--[if lt IE 9]><script type="text/javascript" src="{$app.url.base}/js/polyfill.min.js"></script><![endif]-->
{/block}

{block "scripts_webfont"}
    {$webfont = $app.system->getConfig()->get('webfont')}
    {if $webfont}
        <script type="text/javascript">
            WebFontConfig = {$webfont|json_encode};
            (function() {
                var wf = document.createElement('script');
                wf.src = ('https:' == document.location.protocol ? 'https' : 'http') +
                  '://ajax.googleapis.com/ajax/libs/webfont/1/webfont.js';
                wf.type = 'text/javascript';
                wf.async = 'true';
                var s = document.getElementsByTagName('script')[0];
                s.parentNode.insertBefore(wf, s);
            })();
        </script>
    {/if}
{/block}


{block "content_body"}
    {foreach $layouts as $layout}
        {include file=$layout->getFrontendResource() inline}
    {/foreach}

    {include 'cms/helper/region'}

    <div class="page-wrap">
        {call regionSimple region="header" class="page-header" role="banner" element="header"}

        {call regionSimple region="menu" class="page-menu"}

        {call regionSimple region="title" class="page-title"}

        {call regionSimple region="hero" class="page-hero"}

        {call region region="content" class="page-main" role="main"}

        {call region region="doormat" class="page-doormat"}

        {call region region="footer" class="page-footer" role="contentinfo" element="footer"}

        {if isset($widgets.flyout)}
            <div class="flyout region" id="flyout">
                <button class="btn flyout__close"><i class="icon icon--times"></i> {translate key="label.close"}</button>
                {call region region="flyout"}
            </div>
            <div class="flyout__overlay"></div>
        {/if}
    </div> <!-- /.page-wrap -->

{/block}

{block "scripts"}
    {script src="carbon/js/jquery-2.1.4.min.js"}
    {script src="js/main.min.js"}
{/block}

{block "scripts_polyfills"}
    <!--[if lt IE 9]><script type="text/javascript" src="{$app.url.base}/js/selectivizr.min.js"></script><![endif]-->
{/block}
