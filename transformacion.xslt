<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" version="4.01" encoding="utf-8" doctype-public="-//W3C//DTD HTML 4.01//EN" doctype-system="http://www.w3.org/TR/html4/strict.dtd"/>
	<!-- En primer lugar, es importante mencionar que he tomado la dtd y los documentos xml marcados según ésta, entregados en la práctiva 2. Las unicas modificaciones que he hecho son la creación de un atributo para los elementos "reciclar", "codigo_qr" y "codigo_barras". Para codigo qr es una url que lleva al documento original. Para los otros dos, es una cadena de caracteres a la que la llama en la hoja xslt. Creo que este último también puede hacerse como valor fijo o predefinido.-->
	<!-- Utilizo El elemento anterior, <xsl:output> para generar HTML 4.01 estricto codificado con UTF-8, siguiendo las recomendaciones de los profesores, para evitar generar un HTML genérico. -->


		<xsl:template match="/">

			<html lang="es-ES">
				<head>
					<title>
					<xsl:value-of select="resolucion/@organizacion"/> - 
					<!-- Así, el título de la página HTML será el referido en las comillas -->
					<xsl:value-of select="resolucion/@ente_aprobacion"/> - 
					<!-- Así, el título de la página HTML será el referido en las comillas -->
					<xsl:value-of select="resolucion/@id"/>
					<!-- Así, el título de la página HTML será el referido en las comillas -->
					</title>
						<!-- De esta manera, los documentos tienen en el título la siguiente formula: "Naciones Unidas - Consejo de Seguridad - [identificador de la resolucion]. -->
				</head>
				<body style="">
					<xsl:apply-templates/>
				</body>
			</html>
		</xsl:template>
		<xsl:template match="resolucion">
				<xsl:apply-templates/>
		</xsl:template>
		
		<xsl:template match="encabezado_primera_pagina">
			<h3>
				<xsl:value-of select="organizacion"/>
			</h3>
			<h3>
				<xsl:value-of select="identificador"/>
			</h3>
			<hr/>
			<!-- De esta manera, los documentos representan con encabezados de tercer nivel, los elementos "organizacion" e "identificador". Faltaría poner los dos en la mismo línea, el primero a la izquierda y el segundo a la derecha. Supongo que se podría hacer conbinando cajas <div></div> y su atributo "float". Después, se inserta una línea horizontal. -->

		</xsl:template>
		
		<xsl:template match="resolucion/cuadro_superior">
			<h1>
				<xsl:value-of select="organo"/>
			</h1>
			<p><img src="{logotipo_organizacion/@fuente}"/>
			</p>
			<p>
				<xsl:value-of select="lugar_aprobacion">
				</xsl:value-of><br/>
				<xsl:value-of select="fecha_aprobacion">
				</xsl:value-of>
			</p>
			<!-- De esta manera, se representa el organo "Consejo de Seguridad" con un encabezado de primer nivel, se inserta una imagen cuya ruta relativa toma el valor del atributo "fuente" del elemento "logotipo_organizacion" y se presenta en un párrafo con salto de línea los elementos lugar y fecha de apronación. -->
			
		</xsl:template>
		
		<xsl:template match="resolucion/titulo">
			<hr/>
			<h2>
				<xsl:value-of select=".">
				</xsl:value-of>
			</h2>
		</xsl:template>
		<xsl:template match="resolucion/subtitulo">
			<h3>
				<xsl:value-of select=".">
				</xsl:value-of>
			</h3>
			<!-- De esta manera, se representan los elementos "titulo" y "subtitulo" con encabezados de nivel 2 y 3, respectivamente. Previamente se generó una línea horizontal.-->
		</xsl:template>
		
		<xsl:template match="resolucion/texto/parrafo">
			<p>
				<xsl:apply-templates/>
			</p>
			<!-- De esta manera, le estamos diciendo al documento que para los elementos parrafo haga lo que se dicte a continuación.-->
		</xsl:template>
		<xsl:template match="resolucion/texto/parrafo/cursiva">
			<em>
				<xsl:value-of select=".">	</xsl:value-of>
			</em>
		</xsl:template>
		
		<!-- De esta manera, le decimos al documento que el contenido de los elementos "cursiva" se incluyan dentro de etiquetas <em></em> para que se represente en cursiva. -->
		
		<xsl:template match="resolucion/texto/parrafo/documento_relacionado">
			<u>
				<xsl:value-of select=".">	</xsl:value-of>
			</u>
		</xsl:template>
		
			<!-- De esta manera, le decimos al documento que el contenido de los elementos "documento_relacionado" se incluyan dentro de etiquetas <u></u> para que se represente subrayado. -->
		
		<xsl:template match="resolucion/texto/parrafo/palabra_clave">
			<b>
				<xsl:value-of select=".">	</xsl:value-of>
			</b>
			</xsl:template>
			
			<!-- De esta manera, le decimos al documento que el contenido de los elementos "palabra_clave" se incluyan dentro de etiquetas <b></b> para que se represente en negrita. -->
			
			<xsl:template match="resolucion/texto/parrafo/organizacion">
			<u>
				<xsl:value-of select=".">	</xsl:value-of>
			</u>
		</xsl:template>
		
		<!-- De esta manera, le decimos al documento que el contenido de los elementos "organizacion" se incluyan dentro de etiquetas <u></u> para que se represente subrayado. -->

		<xsl:template match="resolucion/texto/parrafo/persona_relacionada">
			<u>
				<xsl:value-of select=".">	</xsl:value-of>
			</u>
		</xsl:template>
		
		<!-- De esta manera, le decimos al documento que el contenido de los elementos "documento_relacionado" se incluyan dentro de etiquetas <u></u> para que se represente subrayado. -->

		<xsl:template match="resolucion/texto/parrafo/proyecto_relacionado">
			<u>
				<xsl:value-of select=".">	</xsl:value-of>
			</u>
		</xsl:template>
		
		<!-- De esta manera, le decimos al documento que el contenido de los elementos "documento_relacionado" se incluyan dentro de etiquetas <u></u> para que se represente subrayado. -->

		<xsl:template match="resolucion/pie_primera_pagina">
			<p>
				<xsl:value-of select="codigo_barras/@texto">
				</xsl:value-of>
			</p>
			<p>
				<xsl:value-of select="reciclar/@texto">
				</xsl:value-of>
			</p>
			<p>[<a href="{codigo_qr/@url}" target="_blank">Código QR</a>]</p>
		</xsl:template>
		
		<!-- Aquí estamos diciendo que en el documento se generen tres parragos: uno con el contenido que hay en el atributo "texto" del elemento "codigo_barras", otro con el contenido del atributo "texto" del elemento "reciclar" y otro con el texto "[Código QR]" donde "Código QR" es un enlace cuyo atributo "href" toma por valor el atributo "url" del elemento "codigo_qr". -->


</xsl:stylesheet>
