{* widget: assets action: index; translation: widget.assets *}

{if $assets}
<div class="widget widget-assets clearfix {$app.cms.properties->getWidgetProperty('style.container')}" id="widget-{$app.cms.widget}">
    {if $title}
        <h2 class="toc {$app.cms.properties->getWidgetProperty('style.title')}">{$title}</h2>
    {/if}
    <div class="assets">
    {foreach $assets as $asset}
        {if $asset->type == 'image'}
            <div class="spacer--med">
                {if $asset->getValue()}
                    <img src="{image src=$asset->getValue() width=400 height=300 transformation='resize'}" alt="{$asset->getAlt()}" class="image image--responsive">
                {/if}
            </div>
        {else}
            {$file = $asset->getValue()|decorate:'file'}
            <div class="spacer--med">
                <a href="{asset src=$asset}" download>{$asset->getName()}</a> <small>({$file->getExtension()}, {$file->getSize()|decorate:'storage.size'})</small>
            </div>
        {/if}
    {/foreach}
    </div>
</div>
{/if}