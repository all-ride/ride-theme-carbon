{* widget: orm.entry; action: index; translation: widget.orm.entry.default *}

<div class="block {if isset($app['cms']['properties'])}{$app['cms']['properties']->getWidgetProperty('style.container')}{/if}" {if isset($app['cms']['widget'])}id="widget-{$app.cms.widget}"{/if}>

{if !$properties->getTitle() && $content->title}
    <h2 class="{if isset($app['cms']['properties'])}{$app['cms']['properties']->getWidgetProperty('style.title')}{/if}">{$content->title}</h2>
{/if}

{if $content->teaser}
    <p>{$content->teaser}</p>
{/if}

{if $content->image}
    <img src="{image src=$content->image width=480 transformation='resize'}" alt="" class="image image--responsive">
{/if}
        
</div>
