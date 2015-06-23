{* widget: files action: index; translation: widget.files *}

{if $files}
    <div class="block block--files {$app.cms.properties->getWidgetProperty('style.container')}" id="widget-{$app.cms.widget}">
        {if $title}
            <h2 class="toc {$app.cms.properties->getWidgetProperty('style.title')}">{$title}</h2>
        {/if}
        <div class="{$app.cms.properties->getWidgetProperty('style.list')}">
        {foreach $files as $index => $file}
            {$fileObj = $file.file|decorate:'file'}
            <a href="{$file.url}" class="download">
                {$file.label}
                <span class="download__meta">({$fileObj->getExtension()} {$fileObj->getSize()|decorate:"storage.size"})</span>
            </a>
        {/foreach}
        </div>
    </div>
{/if}
