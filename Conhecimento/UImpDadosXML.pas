unit UImpDadosXML;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons, xmldom, XMLIntf, msxmldom, XMLDoc;

type
  TCadastro = class
  private
    fcnpjCad :String;
    fnomeCad :String;
    ffantCad :String;
    flgrCad :String;
    fnroCad :String;
    fbairroCad :String;
    fcMunCad :String;
    fmunCad :String;
    fufCad :String;
    fcUfCad :String;
    fcepCad :String;
    fcPaisCad :String;
    fpaisCad :String;
    ffoneCad :String;
    fieCad :String;
  published
    property CnpjCad: String read fcnpjCad write fcnpjCad;
    property NomeCad: String read fnomeCad write fnomeCad;
    property FantCad: String read ffantCad write ffantCad;
    property LgrCad: String read flgrCad write flgrCad;
    property NroCad: String read fnroCad write fnroCad;
    property BairroCad: String read fbairroCad write fbairroCad;
    property CMunCad: String read fcMunCad write fcMunCad;
    property MunCad: String read fmunCad write fmunCad;
    property UFCad: String read fufCad write fufCad;
    property CUFCad: String read fcUfCad write fcUfCad;
    property CepCad: String read fcepCad write fcepCad;
    property CPaisCad: String read fcPaisCad write fcPaisCad;
    property PaisCad: String read fpaisCad write fpaisCad;
    property FoneCad: String read ffoneCad write ffoneCad;
    property IECad: String read fieCad write fieCad;
  end;
  TInfNF = class
  private
    FModelo: String;
    FSerie: String;
    FNumero: String;
    FDEmissao: String;
    FVBC: String;
    FVICMS: String;
    FVBCST: String;
    FVST: String;
    FVProd: String;
    FVNF: String;
    FCFOP: String;
  published
    property Modelo: String read FModelo write FModelo;
    property Serie: String read FSerie write FSerie;
    property Numero: String read FNumero write FNumero;
    property DEmissao: String read FDEmissao write FDEmissao;
    property VBC: String read FVBC write FVBC;
    property VICMS: String read FVICMS write FVICMS;
    property VBCST: String read FVBCST write FVBCST;
    property VST: String read FVST write FVST;
    property VProd: String read FVProd write FVProd;
    property VNF: String read FVNF write FVNF;
    property CFOP: String read FCFOP write FCFOP;
  end;

  TArrayOfTInfNF = Array of TInfNF;
  
  TDFe = class
  private
    FChaveAcesso: String;
    FModelo: String;
    FValorCarga: String;
    FProPred: String;
    FOutCat: String;
    FPesoBruto: String;
    FPesoBC: String;
    FPesoAferido: String;
    FVolumes: String;
    FCubagem: String;
    FInfNF: TArrayOfTInfNF;
    FInfNFe: TStringList;
    FCMunIni: String;
    FXMunIni: String;
    FCMunFim: String;
    FXMunFim: String;
    FUFIni: String;
    FUFFim: String;
    FTomador: String;
  published
    property ChaveAcesso: String read FChaveAcesso write FChaveAcesso;
    property Modelo: String read FModelo write FModelo;
    property ValorCarga: String read FValorCarga write FValorCarga;
    property ProPred: String read FProPred write FProPred;
    property OutCat: String read FOutCat write FOutCat;
    property PesoBruto: String read FPesoBruto write FPesoBruto;
    property PesoBC: String read FPesoBC write FPesoBC;
    property PesoAferido: String read FPesoAferido write FPesoAferido;
    property Volumes: String read FVolumes write FVolumes;
    property Cubagem: String read FCubagem write FCubagem;
    property InfNF: TArrayOfTInfNF read FInfNF write FInfNF;
    property InfNFe: TStringList read FInfNFe write FInfNFe;
    property CMunIni: String read FCMunIni write FCMunIni;
    property XMunIni: String read FXMunIni write FXMunIni;
    property CMunFim: String read FCMunFim write FCMunFim;
    property XMunFim: String read FXMunFim write FXMunFim;
    property UFIni: String read FUFIni write FUFIni;
    property UFFim: String read FUFFim write FUFFim;
    property Tomador: String read FTomador write FTomador;
  end;

  TFImpDadosXML = class(TForm)
    BtOk: TBitBtn;
    BtCancela: TBitBtn;
    sbArquivoCons: TSpeedButton;
    OpenDialog1: TOpenDialog;
    XMLDocument1: TXMLDocument;
    LBArquivo: TListBox;
    Label1: TLabel;
    procedure sbArquivoConsClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    expedidor: String;
    procedure LeArquivoXML;
    procedure RealizaCadastro(Cadastro: TCadastro);
  public
    { Public declarations }
    DFes: Array of TDFe;
    Remetentes: Array of TCadastro;
    Destinatarios: Array of TCadastro;
    Emitentes: Array of TCadastro;
  end;

var
  FImpDadosXML: TFImpDadosXML;

implementation

uses StrUtils, UBiblioteca, UNfe_cl, UOracle_cl, UUsuario_cl;

{$R *.dfm}

procedure TFImpDadosXML.sbArquivoConsClick(Sender: TObject);
var codCad, i : Integer;
    CadastrosRealizados : String;
begin
  LBArquivo.Clear;
  if OpenDialog1.Execute then
  begin
    Screen.Cursor := crHourGlass;
    CadastrosRealizados := '';
    LBArquivo.Items := OpenDialog1.Files;
    LeArquivoXML;
    for i := 0 to Length(Remetentes) -1 do
    begin
      if Remetentes[i] <> nil then
      begin
        codCad := DMNfe.OPNfe.CallIntegerFunction('COMPARA_CNPJ',[Remetentes[i].CnpjCad]);
        if codCad = 0 then
        begin
          RealizaCadastro(Remetentes[i]);
          CadastrosRealizados := CadastrosRealizados + chr(13)+chr(10)+ Remetentes[i].NomeCad;
        end;
      end;
    end;
    for i := 0 to Length(Destinatarios) -1 do
    begin
      if Destinatarios[i] <> nil then
      begin
        codCad := DMNfe.OPNfe.CallIntegerFunction('COMPARA_CNPJ',[Destinatarios[i].CnpjCad]);
        if codCad = 0 then
        begin
          RealizaCadastro(Destinatarios[i]);
          CadastrosRealizados := CadastrosRealizados + chr(13)+chr(10)+ Destinatarios[i].NomeCad;
        end;
      end;
    end;
    for i := 0 to Length(Emitentes) -1 do
    begin
      if Emitentes[i] <> nil then
      begin
        codCad := DMNfe.OPNfe.CallIntegerFunction('COMPARA_CNPJ',[Emitentes[i].CnpjCad]);
        if codCad = 0 then
        begin
          RealizaCadastro(Emitentes[i]);
          CadastrosRealizados := CadastrosRealizados + chr(13)+chr(10)+ Emitentes[i].NomeCad;
        end;
      end;
    end;
    Screen.Cursor := crDefault;
    if(CadastrosRealizados <> '') then
      MessageDlg('Cadastros importados com sucesso!'+ chr(13)+chr(10)+ CadastrosRealizados,mtConfirmation,[mbOK],0);
//    else
//      MessageDlg('Os Cadastros já estavam presentes no banco de dados!' + chr(13)+chr(10)+ 'Nenhum registro importado.',mtConfirmation,[mbOK],0);
  end;
end;

procedure TFImpDadosXML.LeArquivoXML;
var
  nodeIde, nodeInfCTeNorm, nodeInfCarga, nodeInfQ, nodeInfNF,
  nodeInfNFe, nodeTotal, nodeTransp, nodeEmit, nodeDest, nodeToma, nodeRem: IXMLNode;
  xml, tpMed:String;
  i, j: Integer;
begin
  if LBArquivo.Items.Count > 0 then
  begin
    SetLength(DFes,LBArquivo.Items.Count);
    SetLength(Remetentes,LBArquivo.Items.Count);
    SetLength(Destinatarios,LBArquivo.Items.Count);
    SetLength(Emitentes,LBArquivo.Items.Count);
    for i := 0 to LBArquivo.Items.Count - 1 do
    begin
      XMLDocument1.FileName := LBArquivo.Items[i];
      XMLDocument1.Active := true;

      if RightStr(XMLDocument1.DocumentElement.NodeName,4)  <> 'Proc' then
      begin
        MessageDlg('Erro em ' + LBArquivo.Items[i] + ': Tag de distribuição (nfeProc, cteProc ou mdfeProc) inexistente neste documento.' +
          ' Este documento não está em conformidade com o Layout de Distribuição.' +
          ' Entre em contato com o emissor do documento.',
          mtError, [mbOk],0);
        Abort;
      end;
      DFes[i] := TDFe.Create;
      DFes[i].FChaveAcesso := XMLDocument1.DocumentElement.ChildNodes[0].ChildNodes[0].GetAttributeNS('Id', '');

      DFes[i].FModelo := XMLDocument1.DocumentElement.ChildNodes[0].ChildNodes[0].ChildNodes.FindNode('ide').
              ChildNodes['mod'].Text;
      if DFes[i].FModelo = '57' then
      begin
        nodeIde := XMLDocument1.DocumentElement.ChildNodes['CTe'].ChildNodes['infCte'].
          ChildNodes['ide'];
        DFes[i].CMunIni := Copy(nodeIde.ChildNodes.FindNode('cMunIni').Text,3,5);
        DFes[i].XMunIni := nodeIde.ChildNodes.FindNode('xMunIni').Text;
        DFes[i].CMunFim := Copy(nodeIde.ChildNodes.FindNode('cMunFim').Text,3,5);
        DFes[i].XMunFim := nodeIde.ChildNodes.FindNode('xMunFim').Text;
        DFes[i].UFIni := nodeIde.ChildNodes.FindNode('UFIni').Text;
        DFes[i].UFFim := nodeIde.ChildNodes.FindNode('UFFim').Text;
        nodeInfCTeNorm := XMLDocument1.DocumentElement.ChildNodes['CTe'].ChildNodes['infCte'].
          ChildNodes['infCTeNorm'];
        nodeInfCarga := nodeInfCTeNorm.ChildNodes.FindNode('infCarga');
        nodeInfQ := nodeInfCarga.ChildNodes.FindNode('infQ');
        DFes[i].FValorCarga := nodeInfCarga.ChildNodes['vCarga'].Text;
        DFes[i].ValorCarga := StringReplace(DFes[i].ValorCarga ,'.',',', [rfReplaceAll]);
        DFes[i].FProPred := nodeInfCarga.ChildNodes['proPred'].Text;
        DFes[i].FOutCat := nodeInfCarga.ChildNodes['xOutCat'].Text;

        nodeEmit := XMLDocument1.DocumentElement.ChildNodes['CTe'].ChildNodes['infCte'].
        ChildNodes.FindNode('emit');

        Emitentes[i] := TCadastro.Create;
        Emitentes[i].CnpjCad   := nodeEmit.ChildNodes.Nodes['CNPJ'].Text;
        Emitentes[i].nomeCad   := nodeEmit.ChildNodes.Nodes['xNome'].Text;
        Emitentes[i].fantCad   := nodeEmit.ChildNodes.Nodes['xFant'].Text;
        Emitentes[i].ieCad     := nodeEmit.ChildNodes.Nodes['IE'].Text;
        Emitentes[i].lgrCad    := nodeEmit.ChildNodes.Nodes['enderEmit'].ChildNodes.Nodes['xLgr'].Text;
        Emitentes[i].nroCad    := nodeEmit.ChildNodes.Nodes['enderEmit'].ChildNodes.Nodes['nro'].Text;
        Emitentes[i].bairroCad := nodeEmit.ChildNodes.Nodes['enderEmit'].ChildNodes.Nodes['xBairro'].Text;
        Emitentes[i].cMunCad   := nodeEmit.ChildNodes.Nodes['enderEmit'].ChildNodes.Nodes['cMun'].Text;
        Emitentes[i].munCad    := nodeEmit.ChildNodes.Nodes['enderEmit'].ChildNodes.Nodes['xMun'].Text;
        Emitentes[i].ufCad     := nodeEmit.ChildNodes.Nodes['enderEmit'].ChildNodes.Nodes['UF'].Text;
        Emitentes[i].cepCad    := nodeEmit.ChildNodes.Nodes['enderEmit'].ChildNodes.Nodes['CEP'].Text;
        Emitentes[i].cPaisCad  := '1058';
        Emitentes[i].paisCad   := 'BRASIL';
        Emitentes[i].foneCad   := nodeEmit.ChildNodes.Nodes['enderEmit'].ChildNodes.Nodes['fone'].Text;
        Emitentes[i].CUFCad    := Copy(Emitentes[i].CMunCad,1,2);

        nodeRem := XMLDocument1.DocumentElement.ChildNodes['CTe'].ChildNodes['infCte'].
          ChildNodes.FindNode('rem');

        Remetentes[i] := TCadastro.Create;
        Remetentes[i].CnpjCad   := nodeRem.ChildNodes.Nodes['CNPJ'].Text;
        Remetentes[i].nomeCad   := nodeRem.ChildNodes.Nodes['xNome'].Text;
        Remetentes[i].fantCad   := nodeRem.ChildNodes.Nodes['xFant'].Text;
        Remetentes[i].ieCad     := nodeRem.ChildNodes.Nodes['IE'].Text;
        Remetentes[i].lgrCad    := nodeRem.ChildNodes.Nodes['enderReme'].ChildNodes.Nodes['xLgr'].Text;
        Remetentes[i].nroCad    := nodeRem.ChildNodes.Nodes['enderReme'].ChildNodes.Nodes['nro'].Text;
        Remetentes[i].bairroCad := nodeRem.ChildNodes.Nodes['enderReme'].ChildNodes.Nodes['xBairro'].Text;
        Remetentes[i].cMunCad   := nodeRem.ChildNodes.Nodes['enderReme'].ChildNodes.Nodes['cMun'].Text;
        Remetentes[i].munCad    := nodeRem.ChildNodes.Nodes['enderReme'].ChildNodes.Nodes['xMun'].Text;
        Remetentes[i].ufCad     := nodeRem.ChildNodes.Nodes['enderReme'].ChildNodes.Nodes['UF'].Text;
        Remetentes[i].cepCad    := nodeRem.ChildNodes.Nodes['enderReme'].ChildNodes.Nodes['CEP'].Text;
        Remetentes[i].cPaisCad  := nodeRem.ChildNodes.Nodes['enderReme'].ChildNodes.Nodes['cPais'].Text;
        Remetentes[i].paisCad   := nodeRem.ChildNodes.Nodes['enderReme'].ChildNodes.Nodes['xPais'].Text;
        Remetentes[i].foneCad   := nodeRem.ChildNodes.Nodes['enderReme'].ChildNodes.Nodes['fone'].Text;
        Remetentes[i].CUFCad    := Copy(Remetentes[i].CMunCad,1,2);
        if Remetentes[i].CPaisCad = '' then
          Remetentes[i].CPaisCad := '1058'; //Brasil

        nodeDest := XMLDocument1.DocumentElement.ChildNodes['CTe'].ChildNodes['infCte'].
          ChildNodes.FindNode('dest');

        Destinatarios[i] := TCadastro.Create;
        Destinatarios[i].CnpjCad := nodeDest.ChildNodes['CNPJ'].Text;
        if trim(Destinatarios[i].CnpjCad) = '' then
          Destinatarios[i].CnpjCad := nodeDest.ChildNodes['CPF'].Text;
        Destinatarios[i].nomeCad   := nodeDest.ChildNodes.Nodes['xNome'].Text;
        Destinatarios[i].fantCad   := nodeDest.ChildNodes.Nodes['xFant'].Text;
        Destinatarios[i].ieCad    := nodeDest.ChildNodes.Nodes['IE'].Text;
        Destinatarios[i].lgrCad    := nodeDest.ChildNodes.Nodes['enderDest'].ChildNodes.Nodes['xLgr'].Text;
        Destinatarios[i].nroCad    := nodeDest.ChildNodes.Nodes['enderDest'].ChildNodes.Nodes['nro'].Text;
        Destinatarios[i].bairroCad := nodeDest.ChildNodes.Nodes['enderDest'].ChildNodes.Nodes['xBairro'].Text;
        Destinatarios[i].cMunCad  := nodeDest.ChildNodes.Nodes['enderDest'].ChildNodes.Nodes['cMun'].Text;
        Destinatarios[i].munCad   := nodeDest.ChildNodes.Nodes['enderDest'].ChildNodes.Nodes['xMun'].Text;
        Destinatarios[i].ufCad     := nodeDest.ChildNodes.Nodes['enderDest'].ChildNodes.Nodes['UF'].Text;
        Destinatarios[i].cepCad    := nodeDest.ChildNodes.Nodes['enderDest'].ChildNodes.Nodes['CEP'].Text;
        Destinatarios[i].cPaisCad  := nodeDest.ChildNodes.Nodes['enderDest'].ChildNodes.Nodes['cPais'].Text;
        Destinatarios[i].paisCad   := nodeDest.ChildNodes.Nodes['enderDest'].ChildNodes.Nodes['xPais'].Text;
        Destinatarios[i].foneCad   := nodeDest.ChildNodes.Nodes['enderDest'].ChildNodes.Nodes['fone'].Text;
        Destinatarios[i].CUFCad    := Copy(Destinatarios[i].CMunCad,1,2);

        if Destinatarios[i].CPaisCad = '' then
          Destinatarios[i].CPaisCad := '1058'; //Brasil

        nodeToma := nodeIde.ChildNodes.FindNode('toma3');
        if nodeToma <> nil then
        begin
          if nodeToma.ChildNodes['toma'].Text = '0' then
          begin
            nodeToma := XMLDocument1.DocumentElement.ChildNodes['CTe'].ChildNodes['infCte'].
              ChildNodes['rem'];
            DFes[i].Tomador := Bib.ift(nodeToma.ChildNodes['CNPJ'] <> nil,
              nodeToma.ChildNodes['CNPJ'].Text, nodeToma.ChildNodes['CPF'].Text);
          end;
          if nodeToma.ChildNodes['toma'].Text = '1' then
          begin
            nodeToma := XMLDocument1.DocumentElement.ChildNodes['CTe'].ChildNodes['infCte'].
              ChildNodes['exp'];
            DFes[i].Tomador := Bib.ift(nodeToma.ChildNodes['CNPJ'] <> nil,
              nodeToma.ChildNodes['CNPJ'].Text, nodeToma.ChildNodes['CPF'].Text);
          end;
          if nodeToma.ChildNodes['toma'].Text = '2' then
          begin
            nodeToma := XMLDocument1.DocumentElement.ChildNodes['CTe'].ChildNodes['infCte'].
              ChildNodes['rec'];
            DFes[i].Tomador := Bib.ift(nodeToma.ChildNodes['CNPJ'] <> nil,
              nodeToma.ChildNodes['CNPJ'].Text, nodeToma.ChildNodes['CPF'].Text);
          end;
          if nodeToma.ChildNodes['toma'].Text = '3' then
          begin
            nodeToma := XMLDocument1.DocumentElement.ChildNodes['CTe'].ChildNodes['infCte'].
              ChildNodes['dest'];
            DFes[i].Tomador := Bib.ift(nodeToma.ChildNodes['CNPJ'] <> nil,
              nodeToma.ChildNodes['CNPJ'].Text, nodeToma.ChildNodes['CPF'].Text);
          end;
        end
        else
        begin
          nodeToma := nodeIde.ChildNodes.FindNode('toma4');
          DFes[i].Tomador := Bib.ift(nodeToma.ChildNodes['CNPJ'] <> nil,
              nodeToma.ChildNodes['CNPJ'].Text, nodeToma.ChildNodes['CPF'].Text);
        end;

        nodeInfQ.ChildNodes.First;
        j := 0;
        repeat
          tpMed := nodeInfQ.ChildNodes['tpMed'].Text;
          if (tpMed = 'PESO BRUTO') OR (tpMed = 'KILOGRAMAS') OR (tpMed = 'KILOS') OR
             (tpMed = 'PESO') then
            DFes[i].PesoBruto := nodeInfQ.ChildNodes['qCarga'].Text;
          if tpMed = 'PESO BASE DE CÁLCULO' then
            DFes[i].PesoBC := nodeInfQ.ChildNodes['qCarga'].Text;
          if tpMed = 'PESO AFERIDO' then
            DFes[i].PesoAferido := nodeInfQ.ChildNodes['qCarga'].Text;
          if tpMed = 'QTDE VOLUMES' then
            DFes[i].Volumes := nodeInfQ.ChildNodes['qCarga'].Text;
          if tpMed = 'CUBAGEM' then
            DFes[i].Cubagem := nodeInfQ.ChildNodes['qCarga'].Text;
          j:= j+1;
          nodeInfQ := nodeInfQ.NextSibling;
        until nodeInfQ = nil;
        DFes[i].FPesoBruto := StringReplace(DFes[i].FPesoBruto ,'.',',', [rfReplaceAll]);
        nodeInfNF := nodeInfCTeNorm.ChildNodes['infDoc'].ChildNodes.
                  FindNode('infNF');
        if nodeInfNF <> nil then
        begin
          SetLength(DFes[i].FInfNF, nodeInfNF.ChildNodes.Count);
          nodeInfNF.ChildNodes.First;
          j := 0;
          repeat
            DFes[i].InfNF[j].FModelo := nodeInfNF.ChildNodes['mod'].Text;
            DFes[i].InfNF[j].FSerie := nodeInfNF.ChildNodes['serie'].Text;
            DFes[i].InfNF[j].FNumero := nodeInfNF.ChildNodes['nDoc'].Text;
            DFes[i].InfNF[j].FDEmissao := nodeInfNF.ChildNodes['dEmi'].Text;
            DFes[i].InfNF[j].VBC := nodeInfNF.ChildNodes['vBC'].Text;
            DFes[i].InfNF[j].VICMS := nodeInfNF.ChildNodes['vICMS'].Text;
            DFes[i].InfNF[j].VBCST := nodeInfNF.ChildNodes['vBCST'].Text;
            DFes[i].InfNF[j].FCFOP := nodeInfNF.ChildNodes['nCFOP'].Text;

            DFes[i].InfNF[j].FVProd := nodeInfNF.ChildNodes['vProd'].Text;
            DFes[i].InfNF[j].FVNF := nodeInfNF.ChildNodes['vNF'].Text;
            j := j+1;
            nodeInfNF := nodeInfNF.NextSibling;
          until nodeInfNF = nil;
        end;
        nodeInfNFe := nodeInfCTeNorm.ChildNodes['infDoc'].
                  ChildNodes.FindNode('infNFe');
        if nodeInfNFe <> nil then
        begin
          DFes[i].InfNFe := TStringList.Create;
          nodeInfNFe.ChildNodes.First;
          j := 0;
          repeat
            DFes[i].InfNFe.Add(nodeInfNFe.ChildNodes['chave'].Text);
            j:= j+1;
            nodeInfNFe := nodeInfNFe.NextSibling;
          until nodeInfNFe = nil;
        end;
      end;
      if DFes[i].FModelo = '55' then
      begin
        nodeDest := XMLDocument1.DocumentElement.ChildNodes['NFe'].ChildNodes['infNFe'].
          ChildNodes['dest'];
        nodeEmit := XMLDocument1.DocumentElement.ChildNodes['NFe'].ChildNodes['infNFe'].
          ChildNodes['emit'];
        DFes[i].CMunIni := Copy(nodeEmit.ChildNodes['enderEmit'].ChildNodes.FindNode('cMun').Text,3,5);
        DFes[i].XMunIni := nodeEmit.ChildNodes['enderEmit'].ChildNodes.FindNode('xMun').Text;
        DFes[i].CMunFim := Copy(nodeDest.ChildNodes['enderDest'].ChildNodes.FindNode('cMun').Text,3,5);
        DFes[i].XMunFim := nodeDest.ChildNodes['enderDest'].ChildNodes.FindNode('xMun').Text;
        DFes[i].UFIni := nodeEmit.ChildNodes['enderEmit'].ChildNodes.FindNode('UF').Text;
        DFes[i].UFFim := nodeDest.ChildNodes['enderDest'].ChildNodes.FindNode('UF').Text;
        nodeTotal := XMLDocument1.DocumentElement.ChildNodes['NFe'].ChildNodes.FindNode('infNFe').
          ChildNodes.FindNode('total');
        DFes[i].ValorCarga := nodeTotal.ChildNodes.FindNode('ICMSTot').ChildNodes.FindNode('vNF').Text;
        DFes[i].ValorCarga := StringReplace(DFes[i].ValorCarga ,'.',',', [rfReplaceAll]);
        nodeTransp := XMLDocument1.DocumentElement.ChildNodes['NFe'].ChildNodes.FindNode('infNFe').
          ChildNodes.FindNode('transp');
        DFes[i].FVolumes := '0';
        DFes[i].FPesoBruto := '0';
        if nodeTransp.ChildNodes.FindNode('vol') <> Nil then
        begin
          if nodeTransp.ChildNodes.FindNode('vol').ChildNodes.FindNode('qVol') <> Nil then
            DFes[i].FVolumes :=
              nodeTransp.ChildNodes.FindNode('vol').ChildNodes.FindNode('qVol').Text;
          if nodeTransp.ChildNodes.FindNode('vol').ChildNodes.FindNode('pesoB') <> Nil then
            DFes[i].FPesoBruto :=
              nodeTransp.ChildNodes.FindNode('vol').ChildNodes.FindNode('pesoB').Text;
          DFes[i].FVolumes := StringReplace(DFes[i].FVolumes ,'.',',', [rfReplaceAll]);
          DFes[i].FPesoBruto := StringReplace(DFes[i].FPesoBruto ,'.',',', [rfReplaceAll]);
        end;
      end;
    end;
  end;
end;

procedure TFImpDadosXML.RealizaCadastro(Cadastro: TCadastro);
var
  wSql :String;
  buscador :TBuscador;
  wCodCidade :String;
  wCodPais: String;
begin
  with DMOracle do
  begin
    //Pega os dados do formulário para salvar no banco de dados
    //Procura se existe UF cadastrada, caso não tenha faz o cadastro
    buscador := TBuscador.Create;
    buscador.Limpa;
    buscador.Adiciona('SELECT COUNT(*) FROM TB_ESTADO WHERE COD_UF_IBGE = ' + Cadastro.CUFCad);
    buscador.Buscar();
    if buscador.Proximo = '0' then
    begin
      wSql := 'INSERT INTO TB_ESTADO(COD_ESTADO, DESC_ESTADO, DESC_SIGLA_ESTADO, COD_UF_IBGE) ';
      wSql := wSql + 'VALUES(' + quotedStr(Cadastro.UFCad) + ',' + quotedStr(Cadastro.UFCad) + ',' + quotedStr(Cadastro.CUFCad) + ',' +
         Cadastro.CUFCad + ')';
      QExecSQL.SQL.Clear;
      QExecSQL.SQL.Add(wSql);
      try
        QExecSQL.Close;
        QExecSQL.ExecSQL;
        DBCemapa.Commit;
      Except
        DBCemapa.Rollback;
        Screen.Cursor := crDefault;
        Abort;
      end;
    end;

    // Procura se existe Cidade, caso não exista faz o cadastro
    buscador.Limpa;
    buscador.Adiciona('SELECT COUNT(*) FROM TB_CIDADE WHERE COD_CIDADE_IBGE = ' + copy(Cadastro.CMunCad,3,5)+
      ' AND COD_ESTADO = ' + QuotedStr(Cadastro.UFCad));
    buscador.Buscar();
    if buscador.Proximo = '0' then
    begin
      wSql := 'INSERT INTO TB_CIDADE(COD_CIDADE, DESC_CIDADE, COD_ESTADO, COD_CIDADE_IBGE) VALUES ';
      wSql := wSql + '(SQCIDADE.NEXTVAL, ' + quotedStr(Cadastro.MunCad) + ',' + quotedStr(Cadastro.UFCad) + ',' + copy(Cadastro.CMunCad,3,5) + ')';
      QExecSQL.SQL.Clear;
      QExecSQL.SQL.Add(wSql);
      try
        QExecSQL.Close;
        QExecSQL.ExecSQL;
        DBCemapa.Commit;
      Except
        DBCemapa.Rollback;
        Screen.Cursor := crDefault;
        Abort;
      end;
    end;

    // Recupera o código da cidade
    wSql := 'SELECT COD_CIDADE FROM TB_CIDADE WHERE COD_CIDADE_IBGE = ' + copy(Cadastro.CMunCad,3,5)
      + ' AND COD_ESTADO = ' + QuotedStr(Cadastro.UFCad);
    QExecSql.SQL.Clear;
    QExecSql.SQL.Add(wSql);
    QExecSQL.Close;
    QExecSQL.Open;
    wCodCidade := QExecSQL.Fields[0].AsString;

    // Recupera o código do país
    wSql := 'SELECT COD_PAIS FROM TB_PAIS WHERE COD_PAIS_IBGE = ' + Cadastro.CPaisCad;
    QExecSql.SQL.Clear;
    QExecSql.SQL.Add(wSql);
    QExecSQL.Close;
    QExecSQL.Open;
    wCodPais := QExecSQL.Fields[0].AsString;

    // Cadastra o fornecedor
    wSql := 'INSERT INTO TB_CADASTRO ( COD_CADASTRO, NOME, COD_TIPO_CADASTRO, COD_ESTADO, ';
    wSql := wSql + 'COD_PAIS, DESC_ENDERECO, DESC_CIDADE, COD_CIDADE, DESC_CEP, NUM_CGC_CPF, ';
    wSql := wSql + Bib.ift(length(Cadastro.CnpjCad) = 14,'NUM_INSCRICAO, ', 'DESC_INSCRICAO_MUNICIPAL, ');
    wSql := wSql + 'DT_CADASTRO, IND_SEXO_CATEGORIA, DESC_TELEFONE, DESC_BAIRRO, ';
    wSql := wSql + 'DESC_FANTASIA, IND_FISICA_JURIDICA, COD_USUARIO) VALUES ( ';
    wSql := wSql + 'SQCADASTRO.NEXTVAL, ' + quotedStr(Cadastro.NomeCad) + ', ' + '2' + ', ' + quotedStr(Cadastro.UFCad) + ', ';
    wSql := wSql + wCodPais +', '+ quotedStr(Cadastro.LgrCad + ', ' + Cadastro.NroCad) + ', ' + quotedStr(Cadastro.MunCad) + ', ' + wCodcidade + ', ';
    wSql := wSql + quotedStr(Cadastro.CepCad) + ', ' + quotedStr(Cadastro.CnpjCad) + ', ' + quotedStr(Cadastro.IECad) + ', ';
    wSql := wSql + quotedStr(DateToStr(DataServ)) + ', ' + quotedStr('M') + ', ' + quotedStr(Cadastro.FoneCad) + ', ' + quotedStr(Cadastro.BairroCad) + ', ';
    wSql := wSql + quotedStr(copy(Cadastro.FantCad,1,30)) + ', ' + quotedStr(Bib.ift(length(Cadastro.CnpjCad) = 14, 'J', 'F')) + ', ' + IntToStr(DMUsuario.CodUsuarioCorrente) + ')';
    QExecSql.Close;
    QExecSql.SQL.Clear;
    QExecSql.SQL.Add(wSql);
    try
      QExecSQL.ExecSQL;
      DBCemapa.Commit;
    Except
      DBCemapa.Rollback;
      Screen.Cursor := crDefault;
      Abort;
    end;
  end;
end;

procedure TFImpDadosXML.FormActivate(Sender: TObject);
begin
  sbArquivoConsClick(Self);
end;

end.
