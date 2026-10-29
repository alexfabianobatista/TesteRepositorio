program TestImportacaoIBSCBS;
{$APPTYPE CONSOLE}
uses SysUtils, ActiveX, DB, DBClient, MidasLib, XMLDoc, XMLIntf,
  UImportacaoIBSCBS in '..\UImportacaoIBSCBS.pas';

procedure Check(OK: Boolean; const Msg: string);
begin
  if not OK then raise Exception.Create(Msg);
end;

procedure Run;
var
  Doc: IXMLDocument;
  Inf, Det: IXMLNode;
  T, Ausente: TIBSCBSImportado;
  D: TClientDataSet;
  Base, IBS, CBS: Currency;
  I: Integer;
  XML, Sep: string;
begin
    Doc := LoadXMLDocument(ParamStr(1));
    Inf := Doc.DocumentElement.ChildNodes['NFe'].ChildNodes['infNFe'];
    XML := Doc.XML.Text;
    Base := 0; IBS := 0; CBS := 0;
    for I := 0 to Inf.ChildNodes.Count - 1 do
    begin
      Det := Inf.ChildNodes[I];
      if Det.LocalName = 'det' then
      begin
        T := LeIBSCBS(Det.ChildNodes['imposto']);
        Check(T.Presente, 'Grupo presente');
        Check(T.CST = '000', 'CST com zeros');
        Check(T.ClassTrib = '000001', 'Classificacao com zeros');
        Base := Base + T.Base; IBS := IBS + T.IBSUF + T.IBSMun; CBS := CBS + T.CBS;
      end;
    end;
    Check(Base = 300, 'Base total'); Check(IBS = 0.30, 'IBS total'); Check(CBS = 2.70, 'CBS total');
    D := TClientDataSet.Create(nil);
    try
      D.FieldDefs.Add('NUM_CST_IBS_CBS', ftString, 3);
      D.FieldDefs.Add('NUM_CLASS_TRIB_IBS_CBS', ftString, 6);
      D.FieldDefs.Add('VAL_BC_IBS_CBS', ftFloat);
      D.FieldDefs.Add('VAL_IBS_EST', ftFloat);
      D.FieldDefs.Add('VAL_IBS_MUN', ftFloat);
      D.FieldDefs.Add('VAL_CBS', ftFloat);
      D.CreateDataSet;
      Base := 0; IBS := 0; CBS := 0;
      for I := 1 to 7 do
      begin
        D.Append;
        GravaIBSCBS(D, T, (I-1)/7, I/7);
        Check(PreservaIBSCBSXML(D, XML), 'Preservar antes de Post');
        D.Post;
        Base := Base + D.FieldByName('VAL_BC_IBS_CBS').AsCurrency;
        IBS := IBS + D.FieldByName('VAL_IBS_EST').AsCurrency;
        CBS := CBS + D.FieldByName('VAL_CBS').AsCurrency;
        Check(PreservaIBSCBSXML(D, XML), 'Preservar depois de Post');
        Check(not PreservaIBSCBSXML(D, ''), 'Nota manual');
        Check(not PreservaIBSCBSXML(D, '<nfeProc><NFe><infNFe><det><imposto/></det></infNFe></NFe></nfeProc>'), 'XML antigo sem IBS/CBS');
      end;
      Check(Base = T.Base, 'Rateio base'); Check(IBS = T.IBSUF, 'Rateio IBS'); Check(CBS = T.CBS, 'Rateio CBS');
      D.Append;
      Ausente := LeIBSCBS(nil);
      GravaIBSCBS(D, Ausente, 0, 1);
      Check(not Ausente.Presente, 'Grupo ausente');
      Check(D.FieldByName('VAL_CBS').IsNull, 'Ausencia sem sobrescrever');
      Check(not PreservaIBSCBSXML(D, XML), 'Item sem IBS/CBS');
      Doc := LoadXMLData('<imposto><IBSCBS><CST>410</CST><cClassTrib>410001</cClassTrib></IBSCBS></imposto>');
      T := LeIBSCBS(Doc.DocumentElement);
      GravaIBSCBS(D, T, 0, 1);
      Check(T.Presente and (T.Base = 0) and (T.CBS = 0), 'Grupo sem gIBSCBS');
      Check(PreservaIBSCBSXML(D, '<nfeProc><NFe><infNFe><det>' + Doc.XML.Text + '</det></infNFe></NFe></nfeProc>'), 'Preservar imposto zero');
      D.Cancel;
      Sep := DecimalSeparator;
      try
        DecimalSeparator := '.';
        Doc := LoadXMLData('<imposto><IBSCBS><CST>000</CST><gIBSCBS><vBC>12.34</vBC><gIBSUF><vIBSUF>0.01</vIBSUF></gIBSUF><gIBSMun><vIBSMun>0.02</vIBSMun></gIBSMun><gCBS><vCBS>0.11</vCBS></gCBS></gIBSCBS></IBSCBS></imposto>');
        T := LeIBSCBS(Doc.DocumentElement);
        Check((T.Base = 12.34) and (T.IBSMun = 0.02), 'Decimal ponto');
        DecimalSeparator := ',';
        T := LeIBSCBS(Doc.DocumentElement);
        Check((T.Base = 12.34) and (T.CBS = 0.11), 'Decimal virgula');
      finally DecimalSeparator := Sep[1]; end;
    finally D.Free; end;
    Doc := nil; Inf := nil; Det := nil;
    Writeln('OK: XML real, CST/classificacao, valores, lotes, ausencia, zeros e separadores decimais.');
end;

begin
  CoInitialize(nil);
  try
    Run;
  finally CoUninitialize; end;
end.
