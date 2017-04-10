{function renderTitles}
    {if $title}
        {$title = $title|text}
        <h2 class="card__title {if isset($titleClass)}{$titleClass}{/if} {$app.cms.properties->getWidgetProperty('style.title')}" id="{$title|safe}">{$title}</h2>
    {/if}
    {if $subtitle}
        {$subtitle = $subtitle|text}
        <h3 class="card__subtitle {$app.cms.properties->getWidgetProperty('style.subtitle')}" id="{$subtitle|safe}">{$subtitle}</h3>
    {/if}
{/function}

{function renderCTA cta=null element='a'}
    {$class = "card__link `$cta->getType()` `$app.cms.properties->getWidgetProperty('style.cta')`"}
    {if $cta->getType() == 'btn--ext'}
        {$class = "$class btn"}
    {/if}

    <{$element} {if $element == 'a'}href="{$cta->getUrl()}" {/if}class="{$class}">
        {$cta->getLabel()|text}
    </{$element}>
{/function}

{function renderTextSimple titleClass=null subtitleClass=null callToActionsType='link'}
    <div class="card card--text">

        {if $image}
            <div class="card__img">
                <img src="{image src=$image width=380 transformation='resize'}" alt="">
            </div>
        {/if}

        <div class="card__main">
            <div class="card__header">
                {call renderTitles title=$title subtitle=$subtitle}
            </div>

            <div class="card__content">
                <div class="card__text">
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
    </div>
{/function}

{function renderText titleClass=null subtitleClass=null callToActionsType='link' ctaClass=null}
    <div class="card card--text">

        {call renderTitles title=$title subtitle=$subtitle titleClass=$titleClass subtitleClass=$subtitleClass}

        {if $image}
            {$imageClass = 'image'}
            {if $imageAlignment == 'left'}
                {$imageClass = "$imageClass image--responsive image--left"}
            {elseif $imageAlignment == 'right'}
                {$imageClass = "$imageClass image--responsive image--right"}
            {elseif $imageAlignment == 'justify'}
                {$imageClass = "$imageClass image--full-width"}
            {else}
                {$imageClass = "$imageClass image--responsive"}
            {/if}
            
            <div class="card__img">
                <img src="{image src=$image width=380 transformation='resize'}" alt="" class="{$imageClass}">
            </div>
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
