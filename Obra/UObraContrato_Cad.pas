unit UObraContrato_Cad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, DBDirceu, OracleData, OraTeste, Grids, DBGrids, variants,
  ActnList, ComObj, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP;

type
  TFObraContrato_Cad = class(TFTCadSimples)
    Label13: TLabel;
    DBEdit13: TDBEdit;
    Opo1: TMenuItem;
    Confirmar2: TMenuItem;
    VoltaConfirmao1: TMenuItem;
    Cancelar2: TMenuItem;
    VoltarConfirmao1: TMenuItem;
    LblSituacao: TLabel;
    RelaoObrasContrato1: TMenuItem;
    PosioContrato1: TMenuItem;
    PgContratos: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    BtFilial: TSpeedButton;
    BtCadastro: TSpeedButton;
    BtObra: TSpeedButton;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit12: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    DBRichEdit1: TDBRichEdit;
    DBRichEdit2: TDBRichEdit;
    DBDirceu1: TDBDirceu;
    DBDirceu3: TDBDirceu;
    DBDirceu2: TDBDirceu;
    DBEdit6: TDBEdit;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    Label6: TLabel;
    DBEdit10: TDBEdit;
    Label15: TLabel;
    DBEdit14: TDBEdit;
    Label16: TLabel;
    DBEdit15: TDBEdit;
    ContratoConstruoPorEmpreitada1: TMenuItem;
    TabSheet3: TTabSheet;
    Label14: TLabel;
    DBEdit11: TDBEdit;
    DSAditivo: TDataSource;
    Label17: TLabel;
    DBEdit16: TDBEdit;
    Label18: TLabel;
    DBEdit17: TDBEdit;
    Label19: TLabel;
    DBEdit18: TDBEdit;
    Label20: TLabel;
    DBEdit19: TDBEdit;
    DBNavigator2: TDBNavigator;
    DBGrid2: TDBGrid;
    GerarContasReceberAditivo1: TMenuItem;
    MemorialDescritivo1: TMenuItem;
    TabSheet4: TTabSheet;
    DBNavigator3: TDBNavigator;
    DBGrid3: TDBGrid;
    DsObraContratoProduto: TDataSource;
    Label21: TLabel;
    DBEdit20: TDBEdit;
    Label22: TLabel;
    DBEdit21: TDBEdit;
    Label23: TLabel;
    DBEdit22: TDBEdit;
    Label24: TLabel;
    DBEdit23: TDBEdit;
    SbProduto: TSpeedButton;
    DBEdit24: TDBEdit;
    UtilizaodeProdutosPorRequisio1: TMenuItem;
    DBEdit25: TDBEdit;
    Label25: TLabel;
    procedure BtFilialClick(Sender: TObject);
    procedure BtCadastroClick(Sender: TObject);
    procedure BtObraClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure Confirmar2Click(Sender: TObject);
    procedure DBEdit6Change(Sender: TObject);
    procedure Cancelar2Click(Sender: TObject);
    procedure VoltaConfirmao1Click(Sender: TObject);
    procedure VoltarConfirmao1Click(Sender: TObject);
    procedure RelaoObrasContrato1Click(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure ContratoConstruoPorEmpreitada1Click(Sender: TObject);
    procedure PgContratosChange(Sender: TObject);
    procedure GerarContasReceberAditivo1Click(Sender: TObject);
    procedure MemorialDescritivo1Click(Sender: TObject);
    procedure SbProdutoClick(Sender: TObject);
    procedure DsObraContratoProdutoStateChange(Sender: TObject);
    procedure UtilizaodeProdutosPorRequisio1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FObraContrato_Cad: TFObraContrato_Cad;
  WinWord, Docs, Doc: Variant;

implementation

uses UObraContrato_cl, UFilialCons, UCadastroCons, UObraCons, UFilial_cl,
  UCadastro_cl, UObra_cl, UObraContrato_Cons, UObraContratoConf,
  UParamSistema_cl, UOracle_cl, UObraContrato_Canc, UContratoObra_Param,
  URelTitulosObraContrato, URPosicaoContrato, URPosicaoContratoTotal,
  USequencia_cl, uBiblioteca, UProdutoCons, UProduto_cl,
  UrObraContratoProduto;

{$R *.DFM}

procedure TFObraContrato_Cad.BtFilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons  = Nil then
     FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal=mrOk Then
    DMObraContrato.QObraContrato_CadCod_Filial.Value:=DMFilial.QFilialConsCod_Filial.Value;
end;

procedure TFObraContrato_Cad.BtCadastroClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons  = Nil then
     FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal=mrOk Then
    DMObraContrato.QObraContrato_CadCod_Cadastro.Value:=DMCadastro.QCadastroConsCod_Cadastro.Value;
end;

procedure TFObraContrato_Cad.BtObraClick(Sender: TObject);
begin
  inherited;
  if FObraCons  = Nil then
     FObraCons := TFObraCons.Create(Application);
  if FObraCons.ShowModal=mrOk Then
    DMObraContrato.QObraContrato_CadCod_Obra.Value:=DMObra.QObra_ConsCod_Obra.Value;
end;

procedure TFObraContrato_Cad.FormActivate(Sender: TObject);
begin
  inherited;
  DMObraContrato.QObraContrato_Cad.Open;
  DMObraContrato.QObraContrato_Aditivo.Open;
  DMObraContrato.QObraContratoProduto.Open;
  //  DMObraContrato.QObraContratoMov.Open;
  If (DMParamSistema.CodEmpresa = 'SRTERRA') or (DMParamSistema.CodEmpresa = 'ALIANCA') Then
   Begin
     DBEdit4.ReadOnly := False;
     DBEdit4.Color := ClWindow;
   End;
end;

procedure TFObraContrato_Cad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMObraContrato.QObraContrato_Cad.Close;
  DMObraContrato.QObraContrato_Aditivo.Close;
  DMObraContrato.QObraContratoProduto.Close;
//  DMObraContrato.QObraContratoMov.Close;
end;

procedure TFObraContrato_Cad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  If DSPrimario.State in [Dsinsert,Dsedit] then
    Begin
      BtFilial.Enabled:=True;
      BtCadastro.Enabled:=True;
      BtObra.Enabled:=True;
    End
  Else
    Begin
      BtFilial.Enabled:=False;
      BtCadastro.Enabled:=False;
      BtObra.Enabled:=False;
    End;
  If DMObraContrato.QObraContrato_CadInd_Situacao.Value = '1' Then
     LblSituacao.Caption := 'DIGITADA';
  If DMObraContrato.QObraContrato_CadInd_Situacao.Value = '2' Then
     LblSituacao.Caption := 'CONFIRMADA';
  If DMObraContrato.QObraContrato_CadInd_Situacao.Value = '3' Then
     LblSituacao.Caption := 'CANCELADA';
end;

procedure TFObraContrato_Cad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FObraContrato_Cons = Nil then
    FObraContrato_Cons := TFObraContrato_Cons.Create(Application);
  If FObraContrato_Cons.ShowModal = mrOk then
  With DMObraContrato do
  Begin
    QObraContrato_Cad.Close;
    QObraContrato_Cad.SetVariable('PK',QObraContrato_ConsCod_Obra_Contrato.Value);
    QObraContrato_Cad.Open;
  End;
end;

procedure TFObraContrato_Cad.Confirmar2Click(Sender: TObject);
begin
  inherited;
  If FObraContratoConf = Nil then
    FObraContratoConf := TFObraContratoConf.Create(Application);
  FObraContratoConf.MeSerie.Text := 'CON';
  FObraContratoConf.EdTotal.Text := FloatTOStr(DMObraContrato.QObraContrato_CadVL_CONTRATO.Value);
  FObraContratoConf.ShowModal;
end;

procedure TFObraContrato_Cad.DBEdit6Change(Sender: TObject);
begin
  inherited;
  With DmObraContrato Do
  Begin
    MMCadSimples.Items[2].Items[0].Enabled := (QObraContrato_CadInd_Situacao.Value = '1');
    MMCadSimples.Items[2].Items[1].Enabled := QObraContrato_CadInd_Situacao.Value = '1';
    MMCadSimples.Items[2].Items[2].Enabled := QObraContrato_CadInd_Situacao.Value = '2';
    MMCadSimples.Items[2].Items[3].Enabled := QObraContrato_CadInd_Situacao.Value = '3';
  End;
End;

procedure TFObraContrato_Cad.Cancelar2Click(Sender: TObject);
Var wComando : String;
begin
  inherited;
  if DMParamSistema.QParamSistemaDt_Fechamento_Sistema.Value >= DMObraContrato.QObraContrato_CadDt_Inicio.Value Then
     ShowMessage('Não é Permitido Voltar Confirmação - Fechamento Contabil')
  else
   Begin
     Try
        If DMObraContrato.QObraContrato_CadInd_Situacao.Value <> '2' Then
           raise Exception.Create('Esta nota não foi confirmada!');
        DMOracle.DBCemapa.StartTransaction;
        // 3.Voltar Conta Pagar
        DMObraContrato.QContaReceberCab.Close;
        DMObraContrato.QContaReceberCab.Open;
        DMObraContrato.QContaReceberMov.Close;
        DMObraContrato.QContaReceberMov.Open;
        While not DMObraContrato.QContaReceberCab.Eof do
        Begin
          If DMObraContrato.QContaReceberMovInd_Tipo_Movimento.Value <> '' Then
          Begin
            If (DMObraContrato.QContaReceberMovInd_Tipo_Movimento.Value <> 'PRINCIPAL') then
              Raise Exception.Create('Conta a Receber com baixas!')
            Else
              DMObraContrato.QContaReceberMov.Delete;
          End;
          DMObraContrato.QContaReceberCab.Delete;
        End;
        DMObraContrato.QContaReceberCab.Close;
        DMObraContrato.QContaReceberMov.Close;
        With DMOracle do
        Begin
          QExecSQL.Close;
          QExecSQL.SQL.Clear;
          wComando := 'UPDATE TB_OBRA_CONTRATO SET IND_SITUACAO='+Chr(39) + '1' + chr(39);
          wComando := wComando + ' WHERE COD_OBRA_CONTRATO = '+DMObraContrato.QObraContrato_CadCOD_OBRA_CONTRATO.Text;
          QExecSQL.SQL.Add(wComando);
          QExecSQL.ExecSQL;

          QExecSQL.Close;
          QExecSQL.SQL.Clear;
          wComando := 'DELETE FROM TB_CAIXA_MOV WHERE COD_CONTRATO_OBRA ='+ DMObraContrato.QObraContrato_CadCOD_OBRA_CONTRATO.Text;
          QExecSQL.SQL.Add(wComando);
          QExecSQL.ExecSQL; 
        End;
        // 9. Voltar Caixa
   {    QCaixa.Close;
        QCaixa.Open;
        While not QCaixa.Eof do
          QCaixa.Delete;
       QCaixa.Close;
    }
       DMOracle.Audit( TOracleDataset1 (DSPrimario.Dataset ), 'Volta Confirmacao' );
       DMOracle.DBCemapa.Commit;
       DMObraContrato.QObraContrato_Cad.Close;
       DMObraContrato.QObraContrato_Cad.Open;
     Except
       DMOracle.DBCemapa.RollBack;
       Raise;
     End;
   End;

end;

procedure TFObraContrato_Cad.VoltaConfirmao1Click(Sender: TObject);
begin
  inherited;
  If DMObraContrato.QObraContrato_CadInd_Situacao.Value = '2' Then
     Raise Exception.Create('Não é possivel cancelar um Contrato confirmado!');
  If DMObraContrato.QObraContrato_CadInd_Situacao.Value = '3' Then
     Raise Exception.Create('Este Contrato já está cancelado');
  If FObraContrato_Canc = Nil then
     FObraContrato_Canc := TFObraContrato_Canc.Create(Application);
  FObraContrato_Canc.ShowModal;
  SBRefreshClick(Self);

end;

procedure TFObraContrato_Cad.VoltarConfirmao1Click(Sender: TObject);
Var wComando : String;
begin
  inherited;
  Try
    If DMObraContrato.QObraContrato_CadInd_Situacao.Value <> '3' Then
       raise Exception.Create('Este Contrato não foi Cancelado!');
    DMOracle.DBCemapa.StartTransaction;
    With DMOracle do
    Begin
      QExecSQL.Close;
      QExecSQL.SQL.Clear;
      wComando := 'UPDATE TB_OBRA_CONTRATO SET IND_SITUACAO='+Chr(39) + '1' + chr(39);
      wComando := wComando + ' WHERE COD_OBRA_CONTRATO = '+DMObraContrato.QObraContrato_CadCOD_OBRA_CONTRATO.Text;
      QExecSQL.SQL.Add(wComando);
      QExecSQL.ExecSQL;
    End;
    DMOracle.DBCemapa.Commit;
    DMObraContrato.QObraContrato_Cad.Close;
    DMObraContrato.QObraContrato_Cad.Open;
  Except
    DMOracle.DBCemapa.RollBack;
    Raise;
  End;

end;

procedure TFObraContrato_Cad.RelaoObrasContrato1Click(Sender: TObject);
begin
  inherited;
  if FObraContrato_Param = Nil then
    FObraContrato_Param := TFObraContrato_Param.Create(Application);
  FObraContrato_Param.PGRelatorio.Pages[0].TabVisible := True;
  if FObraContrato_Param.ShowModal = mrOk then
  with DMObraContrato do
  begin
    QRRelTitulosObraContrato.Close;

    if (Trim(FObraContrato_Param.ME0DtInicio.Text) = '') or
       (Trim(FObraContrato_Param.ME0DtFim.Text)    = '') then
      raise Exception.Create('É necessário informar um período'); 

    if Trim(FObraContrato_Param.ME0Filial.Text) <> '' then
      QRRelTitulosObraContrato.SetVariable('COD_FILIAL',StrToInt(Trim(FObraContrato_Param.ME0Filial.Text)))
    else
      QRRelTitulosObraContrato.SetVariable('COD_FILIAL',Null);

    if Trim(FObraContrato_Param.ME0Cadastro.Text) <> '' then
      QRRelTitulosObraContrato.SetVariable('COD_CADASTRO',StrToInt(Trim(FObraContrato_Param.ME0Cadastro.Text)))
    else
      QRRelTitulosObraContrato.SetVariable('COD_CADASTRO',Null);

    if Trim(FObraContrato_Param.ME0Obra.Text) <> '' then
      QRRelTitulosObraContrato.SetVariable('COD_OBRA',StrToInt(Trim(FObraContrato_Param.ME0Obra.Text)))
    else
      QRRelTitulosObraContrato.SetVariable('COD_OBRA',Null);

    if Trim(FObraContrato_Param.ME0Contrato.Text) <> '' then
      QRRelTitulosObraContrato.SetVariable('NUM_CONTRATO',Trim(FObraContrato_Param.ME0Contrato.Text))
    else
      QRRelTitulosObraContrato.SetVariable('NUM_CONTRATO',Null);

    QRRelTitulosObraContrato.SetVariable('DT_INICIO',StrToDate(FObraContrato_Param.ME0DtInicio.Text));
    QRRelTitulosObraContrato.SetVariable('DT_FIM',StrToDate(FObraContrato_Param.ME0DtFim.Text));

    QRRelTitulosObraContrato.Open;

    if FRelTitulosObraContrato = Nil then
      FRelTitulosObraContrato := TFRelTitulosObraContrato.Create(Application);
      
    If FObraContrato_Param.Rg1Tipo.ItemIndex = 0 Then
      FRelTitulosObraContrato.QRBand4.Enabled := True
    Else
      FRelTitulosObraContrato.QRBand4.Enabled := False;
    if FObraContrato_Param.Ed0Filial.Text <> 'Todas' then
      FRelTitulosObraContrato.QRLEmpresa.Caption := 'Empresa: '+FObraContrato_Param.Ed0Filial.Text
    else
      FRelTitulosObraContrato.QRLEmpresa.Caption := 'Empresa: '+DMParamSistema.QParamSistemaDESC_EMPRESA.Value;

    FRelTitulosObraContrato.QRLPeriodo.Caption := 'Período: '+FObraContrato_Param.ME0DtInicio.Text + ' a ' + FObraContrato_Param.ME0DtFim.Text;

    if FObraContrato_Param.RGPreview.ItemIndex = 0 then
       FRelTitulosObraContrato.QRPrimario.Preview
    else
      FRelTitulosObraContrato.QRPrimario.Print;

    QRRelTitulosObraContrato.Close;
  end;
end;

procedure TFObraContrato_Cad.DBEdit3Exit(Sender: TObject);
begin
  inherited;
  If DBEdit3.Text <> '' Then
     DMObraContrato.QObraContrato_CadDT_INICIO.Text := DMOracle.BuscaNome('SELECT DT_INICIO_OBRA FROM TB_OBRA','COD_OBRA = '+DBEdit3.Text);

end;

procedure TFObraContrato_Cad.SBConfirmarClick(Sender: TObject);
begin
  inherited;
  if DMObraContrato.QObraContrato_CadNum_Contrato.Value = '' then
    DMObraContrato.QObraContrato_CadNum_Contrato.Value := IntToStr(DMSequencia.Sequencia(DMObraContrato.QObraContrato_CadCod_Filial.Value, 'CONTRATOOBRA'));

  Confirmar2Click(Self);
end;

procedure TFObraContrato_Cad.ContratoConstruoPorEmpreitada1Click(
  Sender: TObject);
var Path, campo : String;
begin
  if DMObraContrato.QObraContrato_CadCOD_OBRA_CONTRATO.value <> 0 then
    begin
      Path:=ExtractFilePath(ParamStr(0))+'Contratos\';
      DMFilial.QFilial.Close;
      DMFilial.QFilial.SetVariable('PK',DMObraContrato.QObraContrato_CadCOD_FILIAL.Value);
      DMFilial.QFilial.Open;
      DMCadastro.QCadastro.Close;
      DMCadastro.QCadastro.SetVariable('PK',DMObraContrato.QObraContrato_CadCOD_CADASTRO.Value);
      DMCadastro.QCadastro.Open;
      DMObra.QObra_Cad.Close;
      DMObra.QObra_Cad.SetVariable('PK',DMObraContrato.QObraContrato_CadCOD_OBRA.Value);
      DMObra.QObra_Cad.Open;
      // Cria objeto principal de controle
      WinWord := CreateOleObject('Word.Application');
      // Mostra o Word
      WinWord.Visible := true;
      // Pega uma interface para o objeto que manipula documentos
      Docs := WinWord.Documents;
      // Abre um Documento
      Doc := Docs.Open(Path+'contrato_construcao_empreitada_financiamento.Doc');
      // Substitui texto via "name parameters"
      campo:=DMCadastro.QCadastroNome.Value;
      Doc.Content.Find.Execute(FindText := '%nome_contrato',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroDesc_Funcao.Value;
      Doc.Content.Find.Execute(FindText := '%funcao',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroNum_Inscricao.Value;
      Doc.Content.Find.Execute(FindText := '%rg_contrato',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroNum_Cgc_Cpf.Value;
      Doc.Content.Find.Execute(FindText := '%cpf_contrato',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroNome_Conjuge.Value;
      Doc.Content.Find.Execute(FindText := '%conjuge',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroDesc_Identidade_Conjuge.Value;
      Doc.Content.Find.Execute(FindText := '%rg_conjuge',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroDesc_Cpf_Conjuge.Value;
      Doc.Content.Find.Execute(FindText := '%cpf_conjuge',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroDesc_Endereco.Value;
      Doc.Content.Find.Execute(FindText := '%endereco_contrato',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroDesc_Bairro.Value;
      Doc.Content.Find.Execute(FindText := '%bairro',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroDesc_Cidade.Value;
      Doc.Content.Find.Execute(FindText := '%cidade',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroCod_Estado.Value;
      Doc.Content.Find.Execute(FindText := '%estado',ReplaceWith := campo,Replace:=2);

      campo:=DMObraContrato.QObraContrato_CadQT_OBRA.Text;
      Doc.Content.Find.Execute(FindText := '%metros',ReplaceWith := campo,Replace:=2);
      campo := Bib.extenso(DMObraContrato.QObraContrato_CadQT_OBRA.Value, 'METROS');
      Doc.Content.Find.Execute(FindText := '%metro_extenso',ReplaceWith := campo,Replace:=2);
      campo := DMObra.QObra_CadDESC_NUMERO_LOTE.Value;
      Doc.Content.Find.Execute(FindText := '%Num_Lote',ReplaceWith := campo,Replace:=2);
      campo := DMObra.QObra_CadDESC_NUMERO_QUADRA.Value;
      Doc.Content.Find.Execute(FindText := '%Num_Quadra',ReplaceWith := campo,Replace:=2);
      campo:=DMObra.QObra_CadDESC_LOTEAMENTO.Value;
      Doc.Content.Find.Execute(FindText := '%loteamento',ReplaceWith := campo,Replace:=2);
      campo:=DMObra.QObra_CadDESC_BAIRRO.Value;
      Doc.Content.Find.Execute(FindText := '%bai_loteamento',ReplaceWith := campo,Replace:=2);
      campo:=DMObra.QObra_CadNUM_AREA_TERRENO.Text;
      Doc.Content.Find.Execute(FindText := '%arealote',ReplaceWith := campo,Replace:=2);
      campo := Bib.extenso(DMObra.QObra_CadNUM_AREA_TERRENO.Value, 'METROS');
      Doc.Content.Find.Execute(FindText := '%extenso_arealote',ReplaceWith := campo,Replace:=2);
      campo:=FormatDateTime(', dd "de" MMMM "de" yyyy',Date);
      Doc.Content.Find.Execute(FindText := '%data',ReplaceWith := campo,Replace:=2);
      campo:=FormatFloat('#,##0.00',DMObraContrato.QObraContrato_CadVL_CONTRATO.Value);
      Doc.Content.Find.Execute(FindText := '%valor',ReplaceWith := campo,Replace:=2);
      campo:=Bib.extenso(DMObraContrato.QObraContrato_CadVL_CONTRATO.Value,'REAL');
      Doc.Content.Find.Execute(FindText := '%extenso_valor',ReplaceWith := campo,Replace:=2);
      Doc.SaveAs(Path+'contrato_construcao_empreitada_financiamento1.Doc');
      // Imprime
      //Doc.PrintOut(false);
      // Fecha o Word
//      WinWord.Quit;
    end
   else
     ShowMessage('É Necessário selecionar uma obra.');

end;

procedure TFObraContrato_Cad.PgContratosChange(Sender: TObject);
begin
  inherited;
  If PgContratos.ActivePageIndex = 2 Then
     If DMObraContrato.QObraContrato_CadCod_Obra_Contrato.Text <> '' Then
      Begin
        DMObraContrato.QObraContrato_Aditivo.Insert;
        DMObraContrato.QObraContrato_Aditivo.Cancel;
      End;
  If PgContratos.ActivePageIndex = 3 Then
     If DMObraContrato.QObraContrato_CadCod_Obra_Contrato.Text <> '' Then
      Begin
        DMObraContrato.QObraContratoProduto.Insert;
        DMObraContrato.QObraContratoProduto.Cancel;
      End;

end;

procedure TFObraContrato_Cad.GerarContasReceberAditivo1Click(
  Sender: TObject);
begin
  inherited;
   If FObraContratoConf = Nil then
    FObraContratoConf := TFObraContratoConf.Create(Application);
  FObraContratoConf.MeSerie.Text := 'ADI';
  FObraContratoConf.EdTotal.Text := FloatTOStr(DMObraContrato.QObraContrato_AditivoVL_ADITIVO.Value);
  FObraContratoConf.ShowModal;

end;

procedure TFObraContrato_Cad.MemorialDescritivo1Click(Sender: TObject);
var Path, campo : String;
begin
  if DMObraContrato.QObraContrato_CadCOD_OBRA_CONTRATO.value <> 0 then
    begin
      Path:=ExtractFilePath(ParamStr(0))+'Contratos\';
      DMFilial.QFilial.Close;
      DMFilial.QFilial.SetVariable('PK',DMObraContrato.QObraContrato_CadCOD_FILIAL.Value);
      DMFilial.QFilial.Open;
      DMCadastro.QCadastro.Close;
      DMCadastro.QCadastro.SetVariable('PK',DMObraContrato.QObraContrato_CadCOD_CADASTRO.Value);
      DMCadastro.QCadastro.Open;
      DMObra.QObra_Cad.Close;
      DMObra.QObra_Cad.SetVariable('PK',DMObraContrato.QObraContrato_CadCOD_OBRA.Value);
      DMObra.QObra_Cad.Open;
      // Cria objeto principal de controle
      WinWord := CreateOleObject('Word.Application');
      // Mostra o Word
      WinWord.Visible := true;
      // Pega uma interface para o objeto que manipula documentos
      Docs := WinWord.Documents;
      // Abre um Documento
      Doc := Docs.Open(Path+'Memorial_Descritivo.Doc');
      // Substitui texto via "name parameters"
      campo:=DMCadastro.QCadastroNome.Value;
      Doc.Content.Find.Execute(FindText := '%nome',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroNum_Cgc_Cpf.Value;
      Doc.Content.Find.Execute(FindText := '%cpf',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroDesc_Endereco.Value;
      Doc.Content.Find.Execute(FindText := '%endereco',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroDesc_Bairro.Value;
      Doc.Content.Find.Execute(FindText := '%bairro',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroDesc_Cidade.Value;
      Doc.Content.Find.Execute(FindText := '%cidade',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroCod_Estado.Value;
      Doc.Content.Find.Execute(FindText := '%estado',ReplaceWith := campo,Replace:=2);

      campo:=DMObraContrato.QObraContrato_CadQT_OBRA.Text;
      Doc.Content.Find.Execute(FindText := '%Area_edificacao',ReplaceWith := campo,Replace:=2);
      campo:=DMObra.QObra_CadDESC_LOTEAMENTO.Value;
      Doc.Content.Find.Execute(FindText := '%loteamento',ReplaceWith := campo,Replace:=2);
      campo:=DMObra.QObra_CadDESC_BAIRRO.Value;
      Doc.Content.Find.Execute(FindText := '%bai_loteamento',ReplaceWith := campo,Replace:=2);
      campo:=DMObra.QObra_CadNUM_AREA_TERRENO.Text;
      Doc.Content.Find.Execute(FindText := '%Area_terreno',ReplaceWith := campo,Replace:=2);
      campo:=DMObra.QObra_CadDESC_OBRA.Text;
      Doc.Content.Find.Execute(FindText := '%Obra',ReplaceWith := campo,Replace:=2);
      campo:=FormatDateTime(', dd "de" MMMM "de" yyyy',Date);
      Doc.Content.Find.Execute(FindText := '%data',ReplaceWith := campo,Replace:=2);
      Doc.SaveAs(Path+'contrato_construcao_empreitada_financiamento1.Doc');
      // Imprime
      //Doc.PrintOut(false);
      // Fecha o Word
//      WinWord.Quit;
    end
   else
     ShowMessage('É Necessário selecionar uma obra.');

end;

procedure TFObraContrato_Cad.SbProdutoClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons  = Nil then
     FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal=mrOk Then
    DMObraContrato.QObraContratoProdutoCod_Produto.Value:=DMProduto.QProdutoConsCod_Produto.Value;

end;

procedure TFObraContrato_Cad.DsObraContratoProdutoStateChange(
  Sender: TObject);
begin
  inherited;
  If DsObraContratoProduto.State in [Dsinsert,Dsedit] then
    Begin
      SbProduto.Enabled:=True;
    End
  Else
    Begin
      SbProduto.Enabled:=False;
    End;

end;

procedure TFObraContrato_Cad.UtilizaodeProdutosPorRequisio1Click(
  Sender: TObject);
begin
  inherited;
  if FObraContrato_Param = Nil then
     FObraContrato_Param := TFObraContrato_Param.Create(Application);
  FObraContrato_Param.PGRelatorio.Pages[1].TabVisible := True;
  if FObraContrato_Param.ShowModal = mrOk then
  with DMObraContrato do
  begin
    QRObraContratoProduto.Close;

    if Trim(FObraContrato_Param.Me1Filial.Text) <> '' then
      QRObraContratoProduto.SetVariable('COD_FILIAL',StrToInt(Trim(FObraContrato_Param.Me1Filial.Text)))
    else
      QRObraContratoProduto.SetVariable('COD_FILIAL',Null);

    if Trim(FObraContrato_Param.Me1Cadastro.Text) <> '' then
      QRObraContratoProduto.SetVariable('COD_CADASTRO',StrToInt(Trim(FObraContrato_Param.Me1Cadastro.Text)))
    else
      QRObraContratoProduto.SetVariable('COD_CADASTRO',Null);

    if Trim(FObraContrato_Param.ME1Obra.Text) <> '' then
      QRObraContratoProduto.SetVariable('COD_OBRA',StrToInt(Trim(FObraContrato_Param.ME1Obra.Text)))
    else
      QRObraContratoProduto.SetVariable('COD_OBRA',Null);

    QRObraContratoProduto.Open;

    if FRObraContratoProduto = Nil then
      FRObraContratoProduto := TFRObraContratoProduto.Create(Application);


    if FObraContrato_Param.RGPreview.ItemIndex = 0 then
       FRObraContratoProduto.QRPrimario.Preview
    else
      FRObraContratoProduto.QRPrimario.Print;

    QRObraContratoProduto.Close;
  end;

end;

End.
