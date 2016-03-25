{function renderTitles}
    {if $title}
        {$title = $title|text}
        <h2 class="toc text__title {if isset($titleClass)}{$titleClass}{/if} {$app.cms.properties->getWidgetProperty('style.title')}" id="{$title|safe}">{$title}</h2>
    {/if}
    {if $subtitle}
        {$subtitle = $subtitle|text}
        <h3 class="toc text__title {$app.cms.properties->getWidgetProperty('style.subtitle')}" id="{$subtitle|safe}">{$subtitle}</h3>
    {/if}
{/function}

{function renderCTA cta=null element='a'}
    {$class = "block__cta `$cta->getType()` `$app.cms.properties->getWidgetProperty('style.cta')`"}
    {if $cta->getType() == 'btn--ext'}
        {$class = "`$class` btn"}
    {/if}

    <{$element} {if $element == 'a'}href="{$cta->getUrl()}" {/if}class="{$class}">
        {$cta->getLabel()|text}
    </{$element}>
{/function}

{function name="renderTextSimple" titleClass=null subtitleClass=null callToActionsType='link'}
    <div class="excerpt text__inner clearfix">

        {if $image}
            <div class="excerpt__aside">
                <div class="excerpt__image">
                    <img src="{image src=$image width=140 height=140 transformation="resize"}" alt="" class="image image--full-width">
                </div>
            </div>
        {/if}

        <div class="excerpt__main">
            {call renderTitles title=$title subtitle=$subtitle}

            <div class="excerpt__ct">
                {$html|text}
            </div>
            {foreach $callToActions as $callToAction}
                {if $callToActionsType != 'link'}
                    {call renderCTA cta=$callToAction element='span'}
                {else}
                    {call renderCTA cta=$callToAction}
                {/if}
            {/foreach}
        </div>
    </div>
{/function}

{function name="renderText" titleClass=null subtitleClass=null callToActionsType='link' ctaClass=null}
    <div class="text__inner clearfix">

        {call renderTitles title=$title subtitle=$subtitle titleClass=$titleClass subtitleClass=$subtitleClass}

        {if $image}
            {$imageClass = 'image'}
            {if $imageAlignment == 'left'}
                {$imageClass = "`$imageClass` image--responsive image--left"}
            {elseif $imageAlignment == 'right'}
                {$imageClass = "`$imageClass` image--responsive image--right"}
            {elseif $imageAlignment == 'justify'}
                {$imageClass = "`$imageClass` image--full-width"}
            {else}
                {$imageClass = "`$imageClass` image--responsive"}
            {/if}
            <img src="{image src=$image width=300 height=300 transformation="resize"}" alt="" class="{$imageClass}">
        {/if}

        {$html|text}

        {if $callToActions}
            <ul class="list--unstyled">
                {foreach $callToActions as $callToAction}
                    <li>
                        {call renderCTA cta=$callToAction}
                    </li>
                {/foreach}
            </ul>
        {/if}

    </div>
{/function}
