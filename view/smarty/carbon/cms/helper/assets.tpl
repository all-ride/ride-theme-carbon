{function renderAssets assets=null}
    {if $assets}
        <div class="block">
            <div class="grid grid--5-col grid--bp-med-10-col">
                {foreach $assets as $asset}
                    {if $asset@index > 10}
                        {break}
                    {/if}

                    {image src=$asset->getThumbnail() width=180 height=180 transformation='crop' var='thumb'}
                    <div class="grid__item">
                        {if $asset->getType() == 'video'}
                        <a class="colorbox--video js-gallery-video" href="{$asset->getEmbedUrl()}" rel="album"{if $asset->getDescription()} title="{$asset->getDescription()|text|escape}"{/if}>
                        {else}
                        <a class="colorbox js-gallery-image" href="{image src=$asset->getValue() width=1000 height=1000 transformation='resize'}" rel="album"{if $asset->getDescription()} title="{$asset->getDescription()|text|escape}"{/if}>
                        {/if}
                            <img src="{$thumb}" alt="{$asset->getAlt()}" class="image image--full-width">
                        </a>
                    </div>
                {/foreach}
            </div>
        </div>
    {/if}
{/function}
