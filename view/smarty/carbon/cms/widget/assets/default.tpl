{* widget: assets action: index; translation: widget.assets *}

{if $assets}
<div class="widget widget-assets clearfix {if isset($app['cms']['properties'])}{$app['cms']['properties']->getWidgetProperty('style.container')}{/if}" {if isset($app['cms']['widget'])}id="widget-{$app['cms']['widget']}"{/if}>
    {if $title}
        <h2 class="toc {if isset($app['cms']['properties'])}{$app['cms']['properties']->getWidgetProperty('style.title')}{/if}">{$title}</h2>
    {/if}
    <div class="assets">
    {foreach $assets as $asset}
        {if $asset->type == 'image'}
            <div class="spacer--med">
                {if $asset->getValue()}
                    <img src="{image src=$asset->getValue() width=380 transformation='resize'}" alt="{$asset->getAlt()}" class="image image--responsive">
                {/if}
            </div>
        {else}
            {$file = $asset->getValue()|decorate:'file'}
            {url id='assets.value' parameters=['asset' => $asset->getId()] var='assetUrl'}
            <div class="spacer--med">
                <a href="{$assetUrl}" download>{$asset->getName()}</a> <small>({$file->getExtension()}, {$file->getSize()|decorate:'storage.size'})</small>
            </div>
        {/if}
    {/foreach}
    </div>
</div>
{/if}