{* widget: intro; action: index; translation: widget.intro *}

{if $html}
    <div class="block" id="widget-{$app.cms.widget}">
        <div class="grid">
            <div class="grid--bp-med__10">
                <div class="text text--lead {$app.cms.properties->getWidgetProperty('style.container')}" id="widget-{$app.cms.widget}">
                    {$html|text}
                </div>
            </div>
        </div>
    </div>
{/if}
