<?php

function smarty_function_addSectionClasses($params, &$smarty) {
    $app = $smarty->getTemplateVars('app');
    $region = $app['cms']['region'];
    $section = $app['cms']['section'];

    $sectionStyles = $app['cms']['node']->getSectionStyle($region, $section);
    $addedSectionClasses = $params['classes'];

    if ($sectionStyles && $addedSectionClasses && !str_contains($sectionStyles, $addedSectionClasses)) {
        $sectionStyles .= ' ' . $addedSectionClasses;
        $app['cms']['node']->setSectionStyle($region, $section, $sectionStyles);
    }
}
