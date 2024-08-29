# SLAV 1050 Analysis - Sevdah

# General information

## CONTRIBUTORS:

Cody McSherry
 Dr. James Pickett
 (if consulted for difficult word origins:) Dr. Ljiljana Đurašković

## INTRODUCTORY INFORMATION

This project will examine the influence of Turkish language, especially Ottoman Turkish, on Bosnian literature by examining the song and poetry culture Sevdah, which refers to a genre characterized by the feeling of longing, especially of lost or impossible love.

The methodology will consist of examining the origin of significant words in the text (namely those words which are not pronouns, prepositions, grammatical particles, or forms of the common verbs _biti_ or _ići_, meaning to be or to go). As these texts have entered into the cultural consciousness of Bosnia, these texts can be examined as some sort of representation of Bosnian cultural language.

Many people consider the languages Bosnian, Croatian, Serbian, and Montenegrin to be dialects of one language, Serbo-Croatian; however, the people of these respective countries have, since the time of Yugoslavia, denounced this name of their language in order to preserve the differences between the languages and their sovereignty. Whether someone sees these languages as dialects of one South-Slavic language or as four sister-languages, the sole element of importance is not putting them in a hierarchical structure. Therefore, since the origin of these texts is not necessarily easy to determine, especially as the borders have been drawn and redrawn, with the poets and authors regarding themselves under a wide variety of cultural and heritage-based identities, Sevdah as a unifying genre serves as a useful tool for centralizing the experience of Bosnian specific poetry.

The "texts" page gives the option to view the texts in either Cyrillic or Latin letters. Both of these alphabets are used for Bosnian, Croatian, Serbian, and Montenegrin. At the present time, Croatia tends to use Latin primarily, and Serbia tends to use Cyrillic primarily, but this distinction is relatively recent, and there are still pockets in both of these countries which use the other.

The line between poetry and song is not the same in the Balkans as it is in the rest of the European context. The word for both poetry and song is actually the same in Bosnian, just as in Croatia, Serbian, Montegrin, and likely other Balkan languages, _pjesma_. Because of this overlap, these may be referred to as "songs" or "poems" in English, but truly they all encompass both. For the purposes of examining them in this project, the musical element must be removed so that the text can be examined, placing it within the European conception of "poetry," while its Balkan genre has not changed.

## HOW TO USE

This assumes that .xml editing will be taking place through `<oXygen/>`, and that all of the changes are pushed through `github`.

The general process is as follows:
- type out the poem in an .xml document in the texts_xml folder
- transform the .xml document as explained through `Regex_transformation_guide.md`
- associate `Schema.rnc`
- APPLY TRANSFORMATION SCENARIOS IN `texts-sevdah.xpr`
    - create the .xhtml document from the .xml document using `cyrillic_to_latin.xsl`
    - save this .xhtml document in the texts_xhtml folder
    - create the .xhtml document for the chart from the .xml document using `statistics_calculations.xsl`
    - save this .xhtml document in the testing_xslt_transform folder
    - create the new .xhtml graphs by author document using `graphs_by_author.xsl`
    - save this .xhtml document in its original location
- if the poem is from a new poet/performer, edit the `graphs_by_author_buttons.js` file to add in the new poet/performer
- link the new documents to the page `text_directory.xhtml`
- update the bibliograhy page to reflect the new text