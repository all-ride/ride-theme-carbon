{function renderTitle title=null class=null}
    {if $title}
        <h2 class="toc {$app.cms.properties->getWidgetProperty('style.title')}{if $class} {$class}{/if}">{$title}</h2>
    {/if}
{/function}

{function renderFilter filters=null}
    {if $filters}
        {include 'cms/helper/orm.filter.form'}
    {/if}
{/function}

{function renderPagination pagination=null}
    {if $pagination}
        {$anchors = $pagination->getAnchors()}

        {if {$anchors|@count} > 3}
            <ul class="pagination">
                {foreach $anchors as $anchor}
                    <li class="pagination__item">
                        {if !($anchor@first or $anchor@last)}
                            {$anchor->addToClass('pagination__btn')}
                        {else}
                            {$anchor->addToClass('pagination__link')}
                        {/if}
                        {if $anchor@first}
                            {if $pagination->getPage() == 1}
                                {continue}
                            {/if}
                            {$anchor->setLabel('label.previous'|translate)}
                            {$anchor->addToClass('pagination__prev')}
                        {/if}
                        {if $anchor@last}
                            {if $pagination->getPage() == $pagination->getPages()}
                                {continue}
                            {/if}
                            {$anchor->setLabel('label.next'|translate)}
                            {$anchor->addToClass('pagination__next')}
                        {/if}

                        {$anchor->getHtml()}
                    </li>
                {/foreach}
            </ul>
        {/if}
    {/if}
{/function}

{function renderMore moreUrl=null moreLabel=null}
    {if $moreUrl}
        <div class="block">
            <a href="{$moreUrl}" class="link link--ext">{$moreLabel}</a>
        </div>
    {/if}
{/function}

{function renderEmpty emptyResultMessage=null}
    <div class="block">{$emptyResultMessage|text}</div>
{/function}

{function renderMeta meta=null}
    <div class="card__meta meta">
        {foreach $meta as $itemClass => $item}
            <div class="meta__item meta__item--{$itemClass}">{$item}</div>
        {/foreach}
    </div>
{/function}

{function renderTags tags=null}
    <div class="card__tags tags">
        {foreach $tags as $tag}
            <div class="tag">{$tag->getName()}</div>
        {/foreach}
    </div>
{/function}

{* Good practise: always keep the transformation width equal to 100n + 80, this fits nicely into the default grid layout with 80px columns and 20px gutters *}
{function renderImage image=null width=180 height=120 transformation='crop'}
    <div class="card__img">
        <img src="{image src=$image width=$width height=$height transformation=$transformation}" alt="" class="image image--responsive">
    </div>
{/function}
