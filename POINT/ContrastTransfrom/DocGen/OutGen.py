#coding:utf-8
"""
Generate documentions.

Copyright (C) 2015  Dai Tianyu (dtysky)

This library is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.

This library is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with this library; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA

My e-mail:
	dtysky@outlook.com

My blog:
	http://dtysky.moe
"""

def complete_source(source, additional_files):
	for f in additional_files:
		source['Files'].append(f)
	return source

def generate_md(source, titles):
	res = ''
	for title in titles:
		if title not in source:
			res += '## %s\n\n\n***\n\n' % title
		if title in ['Version', 'Modified']:
			res += '**%s**  \n%s  \n\n***\n\n' % (title, source[title])
		if title in ['Project', 'Design']:
			res += '## %s\n\n\n' % source[title]
		if title in ['Files'] : 
			res += '### Files\n'
			res += '''<table board = "3", width="100%">\n'''
			res += '<tr>\n'
			res += '<th>Name</th>\n'
			res += '<th>Function</th>\n'
			res += '</tr>\n'
			for p in source[title]:
				res += '<tr>\n'
				res += '<td>%s</td>\n' % p[0]
				res += '<td>%s</td>\n' % p[1]
				res += '</tr>\n'
			res += '</table>\n\n***\n\n'
		if title in ['Function'] : 
			res += '### %s\n%s  \n\n***\n\n' % (title, source[title])
		if title in ['Parameters'] and 'Parameters' in source:
			res += '### Parameters\n'
			res += '''<table board = "3", width="100%">\n'''
			res += '<tr>\n'
			res += '<th>Name</th>\n'
			res += '<th>Type</th>\n'
			res += '<th>Range</th>\n'
			res += '<th>Default</th>\n'
			res += '<th>Description</th>\n'
			res += '</tr>\n'
			for p in source[title]:
				res += '<tr>\n'
				res += '<td>%s</td>\n' % p['name']
				res += '<td>%s</td>\n' % p['type']
				res += '<td>%s</td>\n' % p['range']
				res += '<td>%s</td>\n' % p['default']
				res += '<td>%s</td>\n' % p['description']
				res += '</tr>\n'
			res += '</table>\n\n***\n\n'
		if title in ['Ports'] and 'Ports' in source:
			res += '### Ports\n'
			res += '''<table board = "3", width="100%">\n'''
			res += '<tr>\n'
			res += '<th>Name</th>\n'
			res += '<th>Port</th>\n'
			res += '<th>Type</th>\n'
			res += '<th>Range</th>\n'
			res += '<th>Default</th>\n'
			res += '<th>Description</th>\n'
			res += '</tr>\n'
			for p in source[title]:
				res += '<tr>\n'
				res += '<td>%s</td>\n' % p['name']
				res += '<td>%s</td>\n' % p['port']
				res += '<td>%s</td>\n' % p['type']
				res += '<td>%s</td>\n' % p['range']
				res += '<td>%s</td>\n' % p['default']
				res += '<td>%s</td>\n' % p['description']
				res += '</tr>\n'
			res += '</table>\n\n***\n\n'
		if title in ['Instances'] and 'Instances' in source:
			res += '### Instances\n'
			res += '''<table board = "3", width="100%">\n'''
			res += '<tr>\n'
			res += '<th>Name</th>\n'
			res += '<th>Type</th>\n'
			res += '<th>Description</th>\n'
			res += '</tr>\n'
			for p in source[title]:
				res += '<tr>\n'
				res += '<td>%s</td>\n' % p['name']
				res += '<td>%s</td>\n' % p['type']
				res += '<td>%s</td>\n' % p['description']
				res += '</tr>\n'
			res += '</table>\n\n***\n\n'
	return res

def generate_tcl(source, tcl_help):
	res = 'proc init_gui { IPINST } {\n'
	res += 'ipgui::add_param $IPINST -name "Component_Name"\n'
	res += '#Adding Page\n'
	res += 'set Page_0 [ipgui::add_page $IPINST -name "Page 0" -display_name {Parameters}]\n'
	res += 'set_property tooltip {Parameters} ${Page_0}\n'
	res += 'ipgui::add_param $IPINST -name "color_width" -parent ${Page_0}\n'
	res += 'ipgui::add_param $IPINST -name "im_height" -parent ${Page_0}\n'
	res += 'ipgui::add_param $IPINST -name "im_width" -parent ${Page_0}\n'
	res += 'ipgui::add_param $IPINST -name "im_width_bits" -parent ${Page_0}\n'
	if 'Parameters' in source:
		res += 'ipgui::add_static_text $IPINST -name "Par_Discriptions" -parent ${Page_0} -text {\n'
		for p in source['Parameters']:
			res += '%s: %s, %s\n' % (p['name'], p['type'], p['description'])
		res += '}\n'
	if 'Ports' in source:
		res += '#Adding Page\n'
		res += 'set Ports [ipgui::add_page $IPINST -name "Ports"]\n'
		res += 'set_property tooltip {Ports} ${Ports}\n'
		res += 'ipgui::add_static_text $IPINST -name "Discriptions" -parent ${Ports} -text {\n'
		for p in source['Ports']:
			res += '%s: %s, %s\n' % (p['name'], p['type'], p['description'])
		res += '}\n'
	res += '#Adding Page\n'
	res += '''set Help [ipgui::add_page $IPINST -name "Help"]\n'''
  	res += 'set_property tooltip {Help} ${Help}\n'
  	res += 'ipgui::add_static_text $IPINST -name "Copyright" -parent ${Help} -text {Documents for all modules:\n'
  	res += tcl_help + '\n}\n}'
  	return res