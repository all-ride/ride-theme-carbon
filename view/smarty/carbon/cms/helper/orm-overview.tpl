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
                        {/if}
                        {if $anchor@first}
                            {$anchor->setLabel("label.previous"|translate)}
                            {$anchor->addToClass('pagination__prev')}
                        {/if}
                        {if $anchor@last}
                            {$anchor->setLabel("label.next"|translate)}
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
        <div class="excerpt__more">
            <a href="{$moreUrl}" class="excpert__more-link link--ext">{$moreLabel}</a>
        </div>
    {/if}
{/function}

{function renderEmpty emptyResultMessage=null}
    <p class="excerpt__empty">{$emptyResultMessage|text}</p>
{/function}

{function renderMeta meta=null}
    <div class="meta">
        {foreach $meta as $itemClass => $item}
            <div class="meta__item meta__item--{$itemClass}">{$item}</div>
        {/foreach}
    </div>
{/function}

{function renderTags tags=null}
    <div class="excerpt__tags tags spacer--xsm">
        {foreach $tags as $tag}
            <div class="tag">{$tag->getName()}</div>
        {/foreach}
    </div>
{/function}

{function renderImage image=null width=140 height=105 transformation="crop"}
    <div class="excerpt__img">
        <img src="{image src=$image width=$width height=$height transformation=$transformation}" class="image image--responsive" />
    </div>
{/function}
