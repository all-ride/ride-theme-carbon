{extends 'base/index'}

{if isset($app.cms.context)}
    {block 'head_meta' append}
        {if isset($app.cms.context.canonical)}
            <link rel="canonical" href="{$app.cms.context.canonical}"/>
        {/if}

        {if isset($app.cms.context.localizedUrls)}
            {foreach $app.cms.context.localizedUrls as $localizedUrl}
                <link rel="alternate" hreflang="{$localizedUrl.locale|replace:"_":"-"}" href="{$localizedUrl.url}"/>
            {/foreach}
        {/if}

        {if isset($app.cms.context.pagination)}
            {$paginationUrl = $app.cms.context.pagination->getPreviousLink()}
            {if $paginationUrl}
                <link rel="prev" href="{$paginationUrl}"/>
            {/if}
            {$paginationUrl = $app.cms.context.pagination->getNextLink()}
            {if $paginationUrl}
                <link rel="next" href="{$paginationUrl}"/>
            {/if}
        {/if}

        {$meta = $app.cms.node->getMeta($app.locale)}
        {if $meta}
            {foreach $meta as $metaName => $metaValue}
                {$metaAttribute = 'name'}
                {if $metaName == 'title'}{continue}{/if}
                {if $metaName|strpos:'og:' === 0}
                    {$metaAttribute = 'property'}
                {/if}
                {if $metaName == 'og:image'}
                    {$metaValue = {image src=$metaValue|text}}
                {else}
                    {$metaValue = $metaValue|text|strip_tags|trim}
                {/if}
                <meta {$metaAttribute}="{$metaName}" content="{$metaValue}">
            {/foreach}
        {/if}
    {/block}

    {block 'head_title'}
        {$title = $app.cms.node->getContext('title.site')}
        {if isset($meta.title)}
            {$meta.title|text} | {$title}
        {else}
            {if $app.cms.node->getRoute($app.locale) != '/'}
                {"`$app.cms.node->getContext('title.node')` | $title"}
            {else}
                {$title}
            {/if}
        {/if}
    {/block}

    {block 'body_attributes'} class="page-{$app.cms.node->getId()} {$app.cms.node->get('body.class')}" data-components="{$app.cms.node->get('body.components')}"{/block}
{/if}

{block 'styles'}
    <!--[if gt IE 9><!--><link rel="stylesheet" href="{$app.url.base}/css/main.min.css"><!--<![endif]-->
    <!--[if lte IE 9]><link rel="stylesheet" href="{$app.url.base}/css/main-legacy.min.css"><![endif]-->
{/block}

{block 'scripts_head'}
    <script type="text/javascript" src="{$app.url.base}/js/modernizr.min.js"></script>
    <!--[if lt IE 9]><script type="text/javascript" src="{$app.url.base}/js/polyfill.min.js"></script><![endif]-->
{/block}

{block 'scripts_webfont'}
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

{block 'body' append}
    {isGranted permission="cms.front.contextual.links"}
        {$pageActions = []}
        {$tmpPageActions = []}

        {if isset($app.cms.node)}
            {$params = []}
            {$params['locale'] = $app.locale}
            {$params['site'] = $app.cms.site}
            {$params['revision'] = 'draft'}
            {$params['node'] = $app.cms.node->getId()}
            {url id='cms.node.content' parameters=$params var='editNodeUrl'}
            {$pageActions["$editNodeUrl?referer={$app.url.request|urlencode}"] = "{'label.edit'|translate} `$app.cms.node->getName()`"}
        {/if}

        {if isset($app.cms.context.content)}
            {$params = []}
            {$params['model'] = $app.cms.context.content->type}
            {$params['locale'] = $app.locale}
            {$params['id'] = $app.cms.context.content->data->getId()}
            {$params['action'] = 'edit'}
            {url id='system.orm.scaffold.action.entry' parameters=$params var='editEntryUrl'}
            {$pageActions["$editEntryUrl?referer={$app.url.request|urlencode}"] = "{'label.edit'|translate} `$app.cms.context.content->title`"}
        {/if}

        {foreach $pageActions as $pageActionUrl => $pageActionLabel}
            {isGranted url=$pageActionUrl var='isGranted'}{/isGranted}
            {if $isGranted}
                {$tmpPageActions[$pageActionUrl] = $pageActionLabel}
            {/if}
        {/foreach}

        {$pageActions = $tmpPageActions}

        {if $pageActions}
            <link rel="stylesheet" href="{$app.url.base}/css/contextual-links.css">
            <div class="contextual-links contextual-links--{$app.system->getEnvironment()}">
                <input type="checkbox" id="contextual-links__toggle" class="contextual-links__toggle superhidden">
                <label class="contextual-links__link" for="contextual-links__toggle">
                    <svg viewBox="0 0 24 24">
                        <path d="M22.1,15.1c0.3,0,0.6,0.4,0.6,1.4c0,0.5-0.1,1.1-0.5,1.9c-0.4,0.8-0.9,1.5-1.5,2.1
                            c-0.6,0.6-1.4,1.2-2.2,1.6c-0.8,0.4-1.6,0.7-2.4,0.7c-0.8,0-1.4-0.1-1.8-0.3c-0.4-0.3-0.8-0.6-1.1-1.1c-0.4-0.7-0.8-2-1.1-3.9
                            c-0.3-1.9-0.7-3.3-0.9-4c-0.5-0.1-1-0.2-1.4-0.5c-0.4-0.3-0.6-0.7-0.7-1.1c0-0.5,0.2-0.8,0.6-1c0.4-0.2,0.9-0.4,1.4-0.4
                            c0.5,0,1,0.1,1.5,0.3c0.5-0.5,1-1.1,1.3-1.8c0.3-0.7,0.4-1.5,0.4-2.6c-0.1-1.1-0.5-1.9-1.3-2.5C12.1,3.1,11,2.9,9.6,3
                            C8.2,3.1,7.1,3.3,6.3,3.5C5.6,3.8,5,4.1,4.4,4.4C3.9,4.7,3.5,5,3.1,5.2C2.7,5.5,2.3,5.6,1.9,5.6c-0.4,0-0.6-0.1-0.6-0.3
                            c0-0.2,0.2-0.6,0.5-1.2C2.2,3.6,2.7,3,3.4,2.4C5.3,1,7.4,0.2,9.8,0c2.4-0.1,4.4,0.2,6,1c1.9,0.9,2.9,2.5,3,4.6
                            c0.1,1.8-0.2,3.2-1.1,4.5c-0.9,1.2-2,2.1-3.3,2.7c0.3,0.7,0.6,1.4,0.9,2.1c0.2,0.8,0.5,1.5,0.7,2.1c0.2,0.6,0.5,1.2,0.7,1.6
                            c0.3,0.4,0.6,0.6,0.9,0.6c0.3,0,0.7-0.2,1.2-0.7c0.5-0.4,0.9-0.9,1.3-1.4c0.4-0.5,0.8-1,1.2-1.4C21.6,15.4,21.9,15.1,22.1,15.1z
                             M8,5c0.3,0,0.4,0.3,0.5,1c0,0.7,0,1.4,0,2C8.4,9.1,8.2,10.3,8,11.3c-0.6,2.8-0.8,4.5-0.8,4.9l0.3,4.5c0.1,1.1-0.3,1.9-1.1,2.3
                            c-0.4,0.2-0.7,0.4-1.1,0.6C5,23.9,4.6,24,4.1,24c-0.9,0.1-1.3-0.9-1.5-2.9c-0.1-2,0.2-4.5,0.9-7.5c0.7-3.1,1.5-5.4,2.4-7
                            c0.2-0.3,0.5-0.7,0.8-1C7.2,5.2,7.6,5,8,5z"/>
                    </svg>
                </label>

                <ul class="contextual-links__menu">
                {foreach $pageActions as $pageActionUrl => $pageActionLabel}
                    <li>
                        <a href="{$pageActionUrl}">{$pageActionLabel}</a>
                    </li>
                {/foreach}
                </ul>
            </div>
        {/if}
    {/isGranted}
{/block}

{block 'head' append}
    {include 'cms/helper/analytics'}
    {call googleAnalytics}
{/block}

{block 'content_body'}
    {foreach $layouts as $layout}
        {include file=$layout->getFrontendResource() inline}
    {/foreach}

    {include 'cms/helper/region'}

    <div class="page-wrap">
        <header role="banner" class="page-header">
            {call regionSimple region='header' class='page-header'}
            {call regionSimple region='menu' class='page-menu'}
        </header>

        <div class="page-main" role="main">
            {call region region='title' class='page-title'}
            {call region region='hero' class='page-hero'}
            {call region region='content'}
        </div>

        <footer class="page-footer" role="contentinfo">
            {call region region='doormat' class='page-doormat'}
            {call region region='footer'}
        </footer>

        {if isset($widgets.flyout)}
            <div class="flyout region" id="flyout">
                <button class="btn flyout__close">
                    <i class="icon icon--times"></i> {'label.close'|translate}
                </button>
                {call regionSimple region='flyout'}
            </div>
            <div class="flyout__overlay"></div>
        {/if}
    </div> <!-- /.page-wrap -->
{/block}

{block 'scripts'}
    {script src='carbon/js/jquery-1.11.3.min.js'}
    {script src='js/main.min.js'}
{/block}

{block 'scripts_polyfills'}
    <!--[if lt IE 9]><script type="text/javascript" src="{$app.url.base}/js/selectivizr.min.js"></script><![endif]-->
{/block}
