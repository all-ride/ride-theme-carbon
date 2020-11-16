{* widget: assets action: index; translation: template.assets.raw *}

{if $assets}
<div class="block clearfix {if isset($app['cms']['properties'])}{$app['cms']['properties']->getWidgetProperty('style.container')}{/if}" {if isset($app['cms']['widget'])}id="widget-{$app.cms.widget}"{/if}>
    {if $title}
        <h2 class="toc {if isset($app['cms']['properties'])}{$app['cms']['properties']->getWidgetProperty('style.title')}{/if}">{$title}</h2>
    {/if}
    <div class="assets">
    {foreach $assets as $asset}
        {if $asset->type == 'image'}
            <div class="spacer--med">
                {* <a class="colorbox" href="{url id="assets.value" parameters=["asset" => $asset->getId()]}" title="{$asset->getName()|escape}"> *}
                    {if $asset->getValue()}
                        <img src="{image src=$asset->getValue()}" alt="{$asset->getAlt()}" class="image image--responsive">
                    {/if}
                {* </a> *}
            </div>
        {/if}
    {/foreach}
    </div>
</div>
{/if}
