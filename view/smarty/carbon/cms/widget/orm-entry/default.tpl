{* widget: orm.entry; action: index; translation: widget.orm.entry.default *}

<div class="block {$app.cms.properties->getWidgetProperty('style.container')}" id="widget-{$app.cms.widget}">

{if !$properties->getTitle() && $content->title}
    <h2 class="{$app.cms.properties->getWidgetProperty('style.title')}">{$content->title}</h2>
{/if}

{if $content->teaser}
    <p>{$content->teaser}</p>
{/if}

{if $content->image}
    <img src="{image src=$content->image width=480 transformation='resize'}" alt="" class="image image--responsive">
{/if}
        
</div>
