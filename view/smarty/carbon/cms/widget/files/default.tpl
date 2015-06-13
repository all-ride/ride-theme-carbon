{* widget: files action: index; translation: widget.files.default *}

{if $files}
    <div class="block block--files block--bg {$app.cms.properties->getWidgetProperty('style.container')}" id="widget-{$app.cms.widget}">
    {if $title}
        <h2 class="toc {$app.cms.properties->getWidgetProperty('style.title')}">{$title}</h2>
    {/if}
        <div class="{$app.cms.properties->getWidgetProperty('style.list')}">
        {foreach $files as $index => $file}
            {$fileObj = $file->getValue()|decorate:'file'}
            <a href="{$file.url}" class="download">
                {$file.label}
                <span class="download__meta">({$fileObj->getExtension()} {* {$fileOptions->getSize()|decorate:"storage.size"} *})</span>
            </a>
        {/foreach}
        </div>
    </div>
{/if}
