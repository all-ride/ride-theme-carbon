{* widget: breadcrumbs; action: index; translation: widget.breadcrumbs *}

<div class="block {$app.cms.properties->getWidgetProperty('style.container')}" id="widget-{$app.cms.widget}">
    <div class="breadcrumb {$app.cms.properties->getWidgetProperty('style.menu')}">
        {foreach $app.cms.context.breadcrumbs as $url => $label}
            <span itemscope itemtype="http://data-vocabulary.org/Breadcrumb" class="breadcrumb__item{if $label@last} breadcrumb__item--active{/if}">
              <a href="{$url}" itemprop="url">
                <span itemprop="title">{$label}</span>
              </a>
            </span>
        {/foreach}
    </div>
</div>
