function WriteFigure(aFid, aFigName, aCaption, aAlignment)
% Writes code for a figure to an open tex-file.
%
% Inputs:
% aFid - File identifier of an open tex-file to which code for the figure
%        will be written.
% aFigName - Name of the graphics file to include in the document. The
%            tex-file will be compiled using pdflatex, so the file should
%            be a png-file or a pdf-file.
% aCaption - Caption of the figure.
% aAlignment - Alignment string (such as center) for the figure.
%
% See also:
% SavePlotsGUI, SavePlots, SaveFigure, WriteBeginning, WriteClear,
% WriteEnd, WriteTex

fprintf(aFid,[...
    '\r\n'...
    '\\begin{figure}[t]\r\n'...
    '\\begin{' aAlignment '}\r\n'...
    '\\includegraphics[width = \\columnwidth, height = 0.9\\paperheight, '...
    'keepaspectratio]{' aFigName '}\r\n'...
    '\\begin{changemargin}{0.5in}{0.5in}\r\n'...
    '\\vspace{-0.8cm}\r\n'...
    '\\caption{' SpecChar(SpecChar(aCaption, 'latex'), 'sprintf') '}\r\n'...
    '\\end{changemargin}\r\n'...
    '\\end{' aAlignment '}\r\n'...
    '\\end{figure}\r\n']);
end