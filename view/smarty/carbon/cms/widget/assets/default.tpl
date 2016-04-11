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
                {* <a class="colorbox" href="{url id="assets.value" parameters=["asset" => $asset->getId()]}" title="{$asset->getName()|escape}"> *}
                    {if $asset->getValue()}
                        <img src="{image src=$asset->getValue() width=400 height=300 transformation='resize'}" alt="{$asset->getAlt()}" class="image image--responsive">
                    {/if}
                {* </a> *}
            </div>
        {/if}
    {/foreach}
    </div>
</div>
{/if}