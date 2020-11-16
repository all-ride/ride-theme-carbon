{* widget: breadcrumbs; action: index; translation: widget.breadcrumbs *}

{if isset($app['cms']['context']['breadcrumbs'])}
    <div class="block {if isset($app['cms']['properties'])}{$app['cms']['properties']->getWidgetProperty('style.container')}{/if}"
         {if isset($app['cms']['widget'])}id="widget-{$app['cms']['widget']}"{/if}>
        <div class="breadcrumb {if isset($app['cms']['properties'])}{$app['cms']['properties']->getWidgetProperty('style.menu')}{/if}"
             itemscope="" itemtype="https://schema.org/BreadcrumbList">
            {foreach $app['cms']['context']['breadcrumbs'] as $url => $label}
                <span itemprop="itemListElement" itemscope="" itemtype="https://schema.org/ListItem"
                      class="breadcrumb__scope">
                    {strip}
                        <a href="{$url}" itemprop="item"
                           class="breadcrumb__item{if $label@last} breadcrumb__item--active{/if}">
                        <span itemprop="name">{$label}</span>
                    </a>
                        <meta itemprop="position" content="{$label@iteration}">
                    {/strip}
                </span>
            {/foreach}

        </div>
    </div>
{/if}
