unit UPenhorCedularCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, DBDirceu, ComObj, OracleNavigator, Grids, DBGrids, variants,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  ActnList;

type
  TFPenhorCedularCad = class(TFTCadSimples)
    EmissodeRecibo1: TMenuItem;
    PenhorCedular1: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit8: TDBEdit;
    BtnCadastroCons: TBitBtn;
    BtnProdutoCons: TBitBtn;
    BtnFilialCons: TBitBtn;
    BtnBancoCons: TBitBtn;
    DBRGSituacao: TDBRadioGroup;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit13: TDBEdit;
    DBDirceu1: TDBDirceu;
    DBDirceu2: TDBDirceu;
    DBDirceu3: TDBDirceu;
    DBDirceu4: TDBDirceu;
    TabSheet2: TTabSheet;
    OracleNavigator1: TOracleNavigator;
    DSPenhorCedularBaixa: TDataSource;
    DBGrid1: TDBGrid;
    Label10: TLabel;
    DBEdit9: TDBEdit;
    Label11: TLabel;
    DBEdit10: TDBEdit;
    Label12: TLabel;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    Label13: TLabel;
    GroupBox1: TGroupBox;
    Label14: TLabel;
    DBEdit14: TDBEdit;
    Label15: TLabel;
    DBEdit15: TDBEdit;
    Label16: TLabel;
    DBEdit16: TDBEdit;
    Label17: TLabel;
    DBEdit17: TDBEdit;
    btnCDACons: TBitBtn;
    DBDirceu5: TDBDirceu;
    Label18: TLabel;
    DBEdit18: TDBEdit;
    Label19: TLabel;
    DBEdit19: TDBEdit;
    BtnParceiroCons: TBitBtn;
    DBDirceu6: TDBDirceu;
    Label20: TLabel;
    DBEdit20: TDBEdit;
    btFielDepositarioCons: TBitBtn;
    DBDirceu7: TDBDirceu;
    Label21: TLabel;
    DBEdit21: TDBEdit;
    BtLoteTipo: TBitBtn;
    DBDirceu8: TDBDirceu;
    TabSheet3: TTabSheet;
    DBGrid5: TDBGrid;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    GroupBox4: TGroupBox;
    Label93: TLabel;
    SpeedButton10: TSpeedButton;
    Label94: TLabel;
    Label95: TLabel;
    MeArquivo: TMaskEdit;
    BitBtn5: TBitBtn;
    DBEdit57: TDBEdit;
    DBEdit58: TDBEdit;
    DsPenhorCedularDoc: TDataSource;
    OpenDialog: TOpenDialog;
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure BtnCadastroConsClick(Sender: TObject);
    procedure BtnFilialConsClick(Sender: TObject);
    procedure BtnProdutoConsClick(Sender: TObject);
    procedure BtnBancoConsClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBConsultaClick(Sender: TObject);
    procedure EmissodeRecibo1Click(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure DBEdit2Change(Sender: TObject);
    procedure PenhorCedular1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure btnCDAConsClick(Sender: TObject);
    procedure BtnParceiroConsClick(Sender: TObject);
    procedure btFielDepositarioConsClick(Sender: TObject);
    procedure BtLoteTipoClick(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure DBEdit4Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPenhorCedularCad: TFPenhorCedularCad;
  WinWord, Docs, Doc: Variant;

implementation

uses UPenhorCedular_cl, UCadastroCons, UFilialCons, UCadastro_cl,
  UFilial_cl, UProdutoCons, UBancosCons, UProduto_cl, UBancoAgencia_cl,
  UPenhorCedularCons, UOracle_cl, UBiblioteca, UUsuario_cl,
  UParamSistema_cl, UNotaSaida_cl, UPenhorCedularParam,
  UDescontoAgricolaParam, URPenhorCedular, UCDACons, UCDA_cl,
  URomaneioAgricola_cl, UTipoLoteCons, UTipoLote_cl;

{$R *.DFM}

procedure TFPenhorCedularCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  if DSPrimario.State in [DSInsert, DSEdit] then
    begin
      BtnCadastroCons.Enabled:=True;
      BtnProdutoCons.Enabled:=True;
      BtnFilialCons.Enabled:=True;
      BtnBancoCons.Enabled:=True;
      btnCDACons.Enabled:=True;
      BtnParceiroCons.Enabled:=True;
      btFielDepositarioCons.Enabled:=True;
      BtLoteTipo.Enabled:=True;
    end
  else
    begin
      BtnCadastroCons.Enabled:=False;
      BtnProdutoCons.Enabled:=False;
      BtnFilialCons.Enabled:=False;
      BtnBancoCons.Enabled:=False;
      btnCDACons.Enabled:=False;
      BtnParceiroCons.Enabled:=False;
      btFielDepositarioCons.Enabled:=False;
      BtLoteTipo.Enabled:=False;
    end;
end;

procedure TFPenhorCedularCad.BtnCadastroConsClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = nil then
     FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOK then
     DMPenhorCedular.QPenhorCedularCadCOD_CADASTRO.Value := DMCadastro.QCadastroConsCod_Cadastro.Value;
end;

procedure TFPenhorCedularCad.BtnFilialConsClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = nil then
     FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOK then
     DMPenhorCedular.QPenhorCedularCadCOD_FILIAL.Value := DMFilial.QFilialConsCod_Filial.Value;
end;

procedure TFPenhorCedularCad.BtnProdutoConsClick(Sender: TObject);
begin
  inherited;
  If FProdutoCons = nil then
     FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOK then
     DMPenhorCedular.QPenhorCedularCadCOD_PRODUTO.Value := DMProduto.QProdutoConsCod_Produto.AsInteger;
end;

procedure TFPenhorCedularCad.BtnBancoConsClick(Sender: TObject);
begin
  inherited;
  If FBancosCons = nil then
     FBancosCons := TFBancosCons.Create(Application);
  If FBancosCons.ShowModal = mrOK then
     DMPenhorCedular.QPenhorCedularCadCOD_BANCO_AGENCIA.Value := DMBancoAgencia.QBancoAgenciaConsCOD_BANCO_AGENCIA.Value;
end;

procedure TFPenhorCedularCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMPenhorCedular.QPenhorCedularCad.Close;
  DMPenhorCedular.QPenhorCedularCad.Open;
  DMPenhorCedular.QPenhorCedularBaixa.close;
  DMPenhorCedular.QPenhorCedularBaixa.Open;
  DMPenhorCedular.QPenhor_Cedular_Doc.Open;  
end;

procedure TFPenhorCedularCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMPenhorCedular.QPenhorCedularCad.Close;
  DMPenhorCedular.QPenhorCedularCons.Close;
  DMPenhorCedular.QPenhor_Cedular_Doc.Close;
  DMFilial.QFilial.Close;
  DMBancoAgencia.QBancoAgencia.Close;
end;

procedure TFPenhorCedularCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FPenhorCedularCons = nil then
    FPenhorCedularCons := TFPenhorCedularCons.Create(Application);
  If FPenhorCedularCons.showmodal = mrOK then
  Begin
    DMPenhorCedular.QPenhorCedularCad.Close;
    DMPenhorCedular.QPenhorCedularCad.SetVariable('PK', DMPenhorCedular.QPenhorCedularConsCOD_PENHOR_CEDULAR.Value);
    DMPenhorCedular.QPenhorCedularCad.Open;
  End
end;

function ReplaceStr (Text,oldstring,newstring:string):string;
var atual, strtofind, originalstr:pchar;
NewText:string;
lenoldstring,lennewstring,m,index:integer;
begin //ReplaceStr
  NewText:=Text;
  originalstr:=pchar(Text);
  strtofind:=pchar(oldstring);
  lenoldstring:=length(oldstring);
  lennewstring:=length(newstring);
  Atual:=StrPos(OriginalStr,StrtoFind);
  index:=0;
  while Atual<>nil do
  begin //Atual<>nil
  m:=Atual - OriginalStr - index + 1;
  Delete(NewText,m,lenoldstring);
  Insert(newstring,NewText,m);
  inc(index,lenoldstring-lennewstring);
  Atual:=StrPos(Atual+lenoldstring,StrtoFind);
  end; //Atual<>nil
  Result:=NewText;
end; //ReplaceStr

procedure TFPenhorCedularCad.EmissodeRecibo1Click(Sender: TObject);
var
   Path, wProduto, wData, wQtd, wUmidade : String;
   wValorTotal : Real;
   i :Integer;
   cda_end, cda_num, cda_mat, cda_desc_cart : string;
   wSql, wRes : Array of String;
begin
  inherited;

  setlength(wSql, 2);
  setlength(wRes, 2);

  for i:=0 to 1 do
  begin
    wSql[i] := '';
    wRes[i] := '';
  end;

  if DMPenhorCedular.QPenhorCedularCadCOD_PENHOR_CEDULAR.value <> 0 then
    begin
      cda_end := '';
      if DMPenhorCedular.QPenhorCedularCadCOD_CDA.AsString <> '' then
      begin
        cda_end := cda_end + DMOracle.BuscaNome('SELECT DESC_ENDERECO || '' - '' || DESC_BAIRRO || '' - '' FROM TB_CDA','COD_CDA = ' + DMPenhorCedular.QPenhorCedularCadCOD_CDA.AsString);
        cda_end := cda_end + ' ' + DMOracle.BuscaNome('SELECT DESC_CIDADE || ''-'' || COD_ESTADO FROM TB_CDA, TB_CIDADE','TB_CDA.COD_CIDADE = TB_CIDADE.COD_CIDADE AND COD_CDA = ' + DMPenhorCedular.QPenhorCedularCadCOD_CDA.AsString);
        cda_num := DMOracle.BuscaNome('SELECT NUM_CDA FROM TB_CDA','COD_CDA = ' + DMPenhorCedular.QPenhorCedularCadCOD_CDA.AsString);
        cda_mat := DMOracle.BuscaNome('SELECT DESC_MATRICULA FROM TB_CDA','COD_CDA = ' + DMPenhorCedular.QPenhorCedularCadCOD_CDA.AsString);
        cda_desc_cart := DMOracle.BuscaNome('SELECT DESC_CARTORIO FROM TB_CDA','COD_CDA = ' + DMPenhorCedular.QPenhorCedularCadCOD_CDA.AsString);
      end;
      DmUsuario.Checar_Filial_Usuario( Trim(DMPenhorCedular.QPenhorCedularCadCOD_FILIAL.Text),'AGRICOLA');
      Path:=ExtractFilePath(ParamStr(0))+'Contratos\';
      DmCadastro.QCadastro.Close;
      DMCadastro.QCadastro.SetVariable('PK',DMPenhorCedular.QPenhorCedularCadCOD_CADASTRO.Value);
      DmCadastro.QCadastro.Open;
      wProduto := DmOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO', 'COD_PRODUTO = ' + IntToStr(DMPenhorCedular.QPenhorCedularCadCOD_PRODUTO.Value));
      wQtd:=FormatFloat('#,##0',DMPenhorCedular.QPenhorCedularCadQT_QUANTIDADE.Value);
      wQtd := wQtd + ' (' +Bib.Extenso( DMPenhorCedular.QPenhorCedularCadQT_QUANTIDADE.Value, 'KG') + ') quilogramas.';
      wQtd := trim(ReplaceStr(wQtd,' Quilos.',''));

      if trim(DMPenhorCedular.QPenhorCedularCadCOD_FIEL_DEPOSITARIO.Text) <> '' then
      begin
        wSql[0] := 'SELECT NOME FROM TB_CADASTRO WHERE COD_CADASTRO = ' +
                trim(DMPenhorCedular.QPenhorCedularCadCOD_FIEL_DEPOSITARIO.Text);
        wSql[1] := 'SELECT NUM_CGC_CPF FROM TB_CADASTRO WHERE COD_CADASTRO = ' +
                trim(DMPenhorCedular.QPenhorCedularCadCOD_FIEL_DEPOSITARIO.Text);
        DMOracle.BuscaNomes(wSql, wRes);
      end;

      if trim(DMPenhorCedular.QPenhorCedularCadCOD_PRODUTO.Text) <> '' then
      begin
        DMProduto.QProduto.Close;
        DMProduto.QProduto.SetVariable('PK', trim(DMPenhorCedular.QPenhorCedularCadCOD_PRODUTO.Text));
        DMProduto.QProduto.Open;
      end;

      if trim(DMPenhorCedular.QPenhorCedularCadCOD_PRODUTO.Text) <> '' then
      begin
        wUmidade := DMOracle.BuscaNome('SELECT PERC_MAX_UMIDADE_SEM_DESC FROM TB_PRODUTO_AGRICOLA','COD_PRODUTO = '+
                                       trim(DMPenhorCedular.QPenhorCedularCadCOD_PRODUTO.Text));
      end;

      DMFilial.QFilial.Close;
      DMFilial.QFilial.SetVariable('PK',DMPenhorCedular.QPenhorCedularCadCOD_FILIAL.Value);
      DMFilial.QFilial.Open;
      DMBancoAgencia.QBancoAgencia.Close;
      DMBancoAgencia.QBancoAgencia.SetVariable('PK',DMPenhorCedular.QPenhorCedularCadCOD_BANCO_AGENCIA.Value);
      DMBancoAgencia.QBancoAgencia.Open;

      wValorTotal := ((DMProduto.QProdutoVAL_VAREJO.Value) * (DMPenhorCedular.QPenhorCedularCadQT_QUANTIDADE.Value));

      // Cria objeto principal de controle
      WinWord := CreateOleObject('Word.Application');
      // Mostra o Word
      WinWord.Visible := true;
      // Pega uma interface para o objeto que manipula documentos
      Docs := WinWord.Documents;
      // Abre um Documento
      Doc := Docs.Open(Path+'Recibo.Doc');
      // Substitui texto via "name parameters"
      Doc.Content.Find.Execute(FindText := '%desc_instrumento', ReplaceWith := DMPenhorCedular.QPenhorCedularCadDESC_INSTRUMENTO_CREDITO.Text, Replace:=2);
      Doc.Content.Find.Execute(FindText := '%num_instrumento', ReplaceWith := DMPenhorCedular.QPenhorCedularCadNUM_INSTRUMENTO_CREDITO.Text, Replace:=2);
      Doc.Content.Find.Execute(FindText := '%dt_instrumento', ReplaceWith := DMPenhorCedular.QPenhorCedularCadDT_EMISSAO_INSTRUMENTO.Text, Replace:=2);
      Doc.Content.Find.Execute(FindText := '%cliente', ReplaceWith := DMCadastro.QCadastroNome.Value, Replace:=2);
      Doc.Content.Find.Execute(FindText := '%cpf_cliente', ReplaceWith := DMCadastro.QCadastroNum_Cgc_Cpf.Value, Replace:=2);
      Doc.Content.Find.Execute(FindText := '%endereco_cliente', ReplaceWith := DMCadastro.QCadastroDesc_Endereco.Value, Replace:=2);
      Doc.Content.Find.Execute(FindText := '%cidade_cliente', ReplaceWith := DMCadastro.QCadastroDesc_Cidade.Value, Replace:=2);
      Doc.Content.Find.Execute(FindText := '%estado_cliente', ReplaceWith := DMCadastro.QCadastroCod_Estado.Value, Replace:=2);
      Doc.Content.Find.Execute(FindText := '%banco', ReplaceWith := DMBancoAgencia.QBancoAgenciaDESC_BANCO_AGENCIA.Text, Replace:=2);
      Doc.Content.Find.Execute(FindText := '%desc_agencia', ReplaceWith := DMPenhorCedular.QPenhorCedularCadDESC_AGENCIA.Value, Replace:=2);
      Doc.Content.Find.Execute(FindText := '%dados_cda', ReplaceWith := cda_end, Replace:=2);
      Doc.Content.Find.Execute(FindText := '%banCidade', ReplaceWith := DMBancoAgencia.QBancoAgenciaDESC_CIDADE.Text, Replace:=2);
      Doc.Content.Find.Execute(FindText := '%banEstado', ReplaceWith := DMBancoAgencia.QBancoAgenciaCOD_ESTADO.Text, Replace:=2);
      Doc.Content.Find.Execute(FindText := '%desc_produto', ReplaceWith := wProduto, Replace:=2);
      Doc.Content.Find.Execute(FindText := '%ano_safra', ReplaceWith := DMPenhorCedular.QPenhorCedularCadDT_ANO_SAFRA.Text, Replace:=2);
      Doc.Content.Find.Execute(FindText := '%qtd', ReplaceWith := wQtd, Replace:=2);
      Doc.Content.Find.Execute(FindText := '%filial_cidade', ReplaceWith := DMFilial.QFilialDESC_CIDADE.Text, Replace:=2);
      Doc.Content.Find.Execute(FindText := '%filial_uf', ReplaceWith := DMFilial.QFilialCOD_ESTADO.Text, Replace:=2);
      Doc.Content.Find.Execute(FindText := '%filial_end', ReplaceWith := DMFilial.QFilialDESC_ENDERECO.Text, Replace:=2);
      Doc.Content.Find.Execute(FindText := '%desc_filial', ReplaceWith := DMFilial.QFilialDESC_FILIAL.Text, Replace:=2);
      Doc.Content.Find.Execute(FindText := '%dt_emissao', ReplaceWith := DMPenhorCedular.QPenhorCedularCadDT_EMISSAO.Text, Replace:=2);
      Doc.Content.Find.Execute(FindText := '%cda_end', ReplaceWith := cda_end, Replace:=2);
      Doc.Content.Find.Execute(FindText := '%cda_num', ReplaceWith := cda_num, Replace:=2);
      Doc.Content.Find.Execute(FindText := '%cda_mat', ReplaceWith := cda_mat, Replace:=2);
      Doc.Content.Find.Execute(FindText := '%cda_cart', ReplaceWith := cda_desc_cart, Replace:=2);
      wData := FormatDateTime('dd "de" MMMM "de" yyyy', Date);
      Doc.Content.Find.Execute(FindText := '%dt_geracao', ReplaceWith := wData, Replace:=2);
      wData := FormatDateTime('yyyy', Date);
      Doc.Content.Find.Execute(FindText := '%ano_geracao', ReplaceWith := wData, Replace:=2);
      Doc.Content.Find.Execute(FindText := '%numero_penhor', ReplaceWith := DMPenhorCedular.QPenhorCedularCadNUM_PENHOR_CEDULAR.value, Replace:=2);
      Doc.Content.Find.Execute(FindText := '%nome_fiel_Dep', ReplaceWith := wRes[0],Replace := 2);
      Doc.Content.Find.Execute(FindText := '%cpf_fiel_Dep', ReplaceWith := wRes[1],Replace := 2);
      Doc.Content.Find.Execute(FindText := '%num_volume', ReplaceWith := DMProduto.QProdutoNUM_VOLUMES.Text,Replace := 2);
      Doc.Content.Find.Execute(FindText := '%tipo_produto', ReplaceWith := DMProduto.QProdutoIND_TIPO_PRODUTO.Text,Replace := 2);
      Doc.Content.Find.Execute(FindText := '%preco', ReplaceWith := DMProduto.QProdutoVAL_VAREJO.Text,Replace := 2);
      Doc.Content.Find.Execute(FindText := '%vl_total', ReplaceWith := FormatFloat('#,##0.00', wValorTotal), Replace := 2);
      Doc.Content.Find.Execute(FindText := '%perc_umidade', ReplaceWith := FormatFloat('#,##0.00', StrToFloat(wUmidade)), Replace := 2);
      // Grava documento
      Doc.SaveAs(Path+'Recibo1.Doc');
      // Imprime
      //Doc.PrintOut(false);
      // Fecha o Word
//      WinWord.Quit;}
    end
    else
       ShowMessage('É Necessário selecionar um penhor a ser emitido.');
    DmCadastro.QCadastro.Close;
    DMFilial.QFilial.Close;
    DMBancoAgencia.QBancoAgencia.Close;

end;

procedure TFPenhorCedularCad.SBConfirmarClick(Sender: TObject);
begin
  DmUsuario.Checar_Filial_Usuario( Trim(DMPenhorCedular.QPenhorCedularCadCOD_FILIAL.Text),'AGRICOLA');
  if DSPrimario.State in [DSInsert] Then
  Begin
    with DmRomaneioAgricola do
    begin
      QRomConsFixar.Close;
      QRomConsFixar.SetVariable('CADASTRO',DMPenhorCedular.QPenhorCedularCadCod_Cadastro.Value);
      QRomConsFixar.SetVariable('FILIAL',DMPenhorCedular.QPenhorCedularCadCod_Filial.Value);
      QRomConsFixar.SetVariable('PRODUTO',DMPenhorCedular.QPenhorCedularCadCod_Produto.Value);
      QRomConsFixar.SetVariable('LOTE_TIPO',Null);
//      QRomConsFixar.SetVariable('DATAI',StrToDate('01/01/1900'));
//      QRomConsFixar.SetVariable('DATAF',Date);
      QRomConsFixar.SetVariable('TIPO_FIXAR','EMPRESA');
      QRomConsFixar.Open;
      If DMPenhorCedular.QPenhorCedularCadQt_Quantidade.Value > QRomConsFixarsaldo_fixar.value Then
         Raise Exception.Create('Cliente não possui saldo a fixar para fazer contrato de penhor');
    end;
  End;
  inherited;
end;

procedure TFPenhorCedularCad.DBEdit2Change(Sender: TObject);
begin
  inherited;
  If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'AB') And
     (Trim(DbEdit2.Text) <> '') Then
     DMNotaSaida.MostraMsg(StrToInt(Trim(DbEdit2.Text)));

end;

procedure TFPenhorCedularCad.PenhorCedular1Click(Sender: TObject);
begin
  inherited;
  if FPenhorCedularParam = nil then
    FPenhorCedularParam := TFPenhorCedularParam.create(application);
  FPenhorCedularParam.PGRelatorio.Pages[0].TabVisible:=True;
  if FPenhorCedularParam.showmodal = mrok then
  begin
    DMPenhorCedular.QRPenhorCedular.close;

    if trim(FPenhorCedularParam.ME1Filial.Text) = '' then
      DMPenhorCedular.QRPenhorCedular.SetVariable('COD_FILIAL',null)
    else
      DMPenhorCedular.QRPenhorCedular.SetVariable('COD_FILIAL',StrToInt(trim(FPenhorCedularParam.ME1Filial.Text)));

    if trim(FPenhorCedularParam.ME1Produto.Text) = '' then
      DMPenhorCedular.QRPenhorCedular.SetVariable('COD_PRODUTO',null)
    else
      DMPenhorCedular.QRPenhorCedular.SetVariable('COD_PRODUTO',StrToInt(trim(FPenhorCedularParam.ME1Produto.Text)));

    if trim(FPenhorCedularParam.ME1AnoSafra.Text) = '' then
      DMPenhorCedular.QRPenhorCedular.SetVariable('DT_ANO_SAFRA',null)
    else
      DMPenhorCedular.QRPenhorCedular.SetVariable('DT_ANO_SAFRA',FPenhorCedularParam.ME1AnoSafra.Text);

    Case FPenhorCedularParam.RG1Situacao.ItemIndex Of
     0 : DMPenhorCedular.QRPenhorCedular.SetVariable('IND_SITUACAO','ABERTO');
     1 : DMPenhorCedular.QRPenhorCedular.SetVariable('IND_SITUACAO','FECHADO');
     2 : DMPenhorCedular.QRPenhorCedular.SetVariable('IND_SITUACAO',Null);
    End;

    DMPenhorCedular.QRPenhorCedular.open;

    if FRPenhorCedular = nil then
      FRPenhorCedular := TFRPenhorCedular.create(application);

    if FPenhorCedularParam.RGPreview.ItemIndex = 0 then
      FRPenhorCedular.QRPrimario.Preview
    Else
      FRPenhorCedular.QRPrimario.Print;

    DMPenhorCedular.QRPenhorCedular.close;
  end;

end;

procedure TFPenhorCedularCad.FormCreate(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePage := TabSheet1;
end;

procedure TFPenhorCedularCad.PageControl1Change(Sender: TObject);
begin
  inherited;
  if PageControl1.ActivePage = TabSheet1 then
    DMPenhorCedular.QPenhorCedularCad.RefreshRecord;
end;

procedure TFPenhorCedularCad.btnCDAConsClick(Sender: TObject);
begin
  inherited;
  if fcdaCons = nil then
    fcdaCons := TfcdaCons.create(application);

  if fcdaCons.showmodal = mrok then
    DMPenhorCedular.QPenhorCedularCadCOD_CDA.Value := DMCDA.QCDAConsCOD_CDA.Value;
end;

procedure TFPenhorCedularCad.BtnParceiroConsClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = nil then
     FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOK then
     DMPenhorCedular.QPenhorCedularCadCOD_CADASTRO_PARCEIRO.Value := DMCadastro.QCadastroConsCod_Cadastro.Value;
end;

procedure TFPenhorCedularCad.btFielDepositarioConsClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = nil then
     FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOK then
     DMPenhorCedular.QPenhorCedularCadCOD_FIEL_DEPOSITARIO.Value := DMCadastro.QCadastroConsCod_Cadastro.Value;

end;

procedure TFPenhorCedularCad.BtLoteTipoClick(Sender: TObject);
begin
  inherited;
  If FTipoLoteCons = nil then
     FTipoLoteCons := TFTipoLoteCons.Create(Application);
  If FTipoLoteCons.ShowModal = mrOK then
     DMPenhorCedular.QPenhorCedularCadCOD_LOTE_TIPO.Value := DMTipoLote.QTipoLoteConsCod_Lote_Tipo.Value;

end;

procedure TFPenhorCedularCad.SpeedButton10Click(Sender: TObject);
begin
  inherited;
  If OpenDialog.Execute Then
     MeArquivo.Text := OpenDialog.FileName;

end;

procedure TFPenhorCedularCad.BitBtn5Click(Sender: TObject);
var
  Stream : TStream;
  FileStream : TFileStream;
  wNomeArquivo : String;
  wPosicaoBarra : Integer;
begin
  inherited;
  DMPenhorCedular.QPenhor_Cedular_Doc.Insert;
  Stream := DMPenhorCedular.QPenhor_Cedular_Doc.CreateBlobStream(DMPenhorCedular.QPenhor_Cedular_DocARQUIVO, bmWrite);
  try
    Stream.Seek(0, soFromBeginning);
    FileStream := TFileStream.Create(MeArquivo.Text, fmOpenRead or fmShareDenyWrite);
    try
      Stream.CopyFrom(FileStream, FileStream.Size);
    finally
      FileStream.Free;
    end;
    wNomeArquivo := MeArquivo.Text;
    wPosicaoBarra := Pos('\', wNomeArquivo);
    while (wPosicaoBarra > 0) do begin
      wNomeArquivo := Copy(wNomeArquivo, (wPosicaoBarra+1), Length(wNomeArquivo));
      wPosicaoBarra := Pos('\', wNomeArquivo);
    end;
    DMPenhorCedular.QPenhor_Cedular_DocNOME_ARQUIVO.AsString := wNomeArquivo;
    DMPenhorCedular.QPenhor_Cedular_DocDESCRICAO.AsString := MeArquivo.Text;
    DMPenhorCedular.QPenhor_Cedular_DocDT_INCLUSAO.AsDateTime := Now;
    DMPenhorCedular.QPenhor_Cedular_DocCOD_penhor_cedular.Value := DMPenhorCedular.QPenhorCedularCadCOD_penhor_cedular.Value;

    DMPenhorCedular.QPenhor_Cedular_Doc.Post;
    MessageDlg('Arquivo inserido com sucesso' ,
      MtError, [mbOK], 0);
  finally
    Stream.Free;
  end;


end;

procedure TFPenhorCedularCad.BitBtn4Click(Sender: TObject);
begin
  inherited;
  DMPenhorCedular.QPenhor_Cedular_Doc.Delete;

end;

procedure TFPenhorCedularCad.DBEdit4Exit(Sender: TObject);
begin
  inherited;
  DMOracle.ValidaFilial(DBEdit4.Text);
end;

end.
