{* widget: assets action: index; translation: template.assets.downloads *}

{if $assets}
<div class="widget widget-assets widget-assets--files clearfix {if isset($app['cms']['properties'])}{$app['cms']['properties']->getWidgetProperty('style.container')}{/if}" {if isset($app['cms']['widget'])}id="widget-{$app['cms']['widget']}"{/if}>
    {if $title}
        <h2 class="{if isset($app['cms']['properties'])}{$app['cms']['properties']->getWidgetProperty('style.title')}"{/if}>{$title}</h2>
    {/if}
    <div class="{if isset($app['cms']['properties'])}{$app['cms']['properties']->getWidgetProperty('style.list')}"{/if}>
    {foreach $assets as $asset}
        {if $asset->getSource() == "url"}
            <a href="{$asset->getValue()}" target="_blank">{$asset->getName()}</a>
        {else}
            {$fileObj = $asset->getValue()|decorate:'file'}
            <a href="{url id="assets.value" parameters=["asset" => $asset->getSlug()]}" class="download">
                {$asset->getName()}
                {if is_object($fileObj)}
                    <span class="download__meta">({$fileObj->getExtension()} {$fileObj->getSize()|decorate:'storage.size'})</span>
                {/if}
            </a>
        {/if}
    {/foreach}
    </div>
</div>
{/if}
