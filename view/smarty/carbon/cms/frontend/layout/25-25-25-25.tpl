{function name="layout_25_25_25_25" section=null widgets=null}
<div class="grid grid--bp-sml-2-col grid--bp-med-4-col">
{$block = '1'}
    <div class="grid__item" id="block-{$section}-{$block}">
{if isset($widgets[$block])}
    {foreach $widgets[$block] as $widget}
        {$widget}
    {/foreach}
{/if}
    </div>
{$block = '2'}
    <div class="grid__item" id="block-{$section}-{$block}">
{if isset($widgets[$block])}
    {foreach $widgets[$block] as $widget}
        {$widget}
    {/foreach}
{/if}
    </div>
{$block = '3'}
    <div class="grid__item" id="block-{$section}-{$block}">
{if isset($widgets[$block])}
    {foreach $widgets[$block] as $widget}
        {$widget}
    {/foreach}
{/if}
    </div>
    {$block = '4'}
        <div class="grid__item" id="block-{$section}-{$block}">
    {if isset($widgets[$block])}
        {foreach $widgets[$block] as $widget}
            {$widget}
        {/foreach}
    {/if}
        </div>
</div>
{/function}
