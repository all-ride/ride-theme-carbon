<?php

function smarty_modifier_attributes($array) {

    $attributes = [];

    if (!empty($array)) {
        foreach ($attributeArray as $attribute => $value) {
            $attributes[] = "$attribute=\"$value\"";
        }
    }

    return implode(' ', $attributes);

}