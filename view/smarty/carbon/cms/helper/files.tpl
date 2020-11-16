<ul class="list--border{if isset($class)} $class{/if}">
    {foreach $files as $file}
        {$fileOptions = $app['system'] ? $app['system']->getFileSystem()->getFile($file) : null}
        <li>
          <a href="{$file['url']}" class="download">
            {$file['label']}
              {if $fileOptions}
                <span class="download__meta">({$fileOptions->getExtension()} {$fileOptions->getSize()|decorate:'storage.size'})</span>
              {/if}
          </a>
        </li>
    {/foreach}
</ul>