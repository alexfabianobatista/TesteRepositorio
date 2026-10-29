unit USaldoContabilCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Menus, Db, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, Grids, DBGrids, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, ActnList,ComObj, Variants;

type
  TFSaldoContabilCad = class(TFTCadSimples)
    MENumConta: TMaskEdit;
    Label9: TLabel;
    MECodFilial: TMaskEdit;
    SpeedButton1: TSpeedButton;
    MEFilial: TMaskEdit;
    MEData: TMaskEdit;
    MESaldoAnterior: TMaskEdit;
    MESaldoAtual: TMaskEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    ME1: TMaskEdit;
    MEDescConta: TMaskEdit;
    SpeedButton2: TSpeedButton;
    Label16: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Button1: TButton;
    ODImportaXLS: TOpenDialog;
    procedure FormActivate(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure BtFilialClick(Sender: TObject);
    procedure BtPlanoContaClick(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure MENumContaExit(Sender: TObject);
    procedure DSPrimarioDataChange(Sender: TObject; Field: TField);
    procedure SBIncluirClick(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure SBCancelarClick(Sender: TObject);
    procedure MECodFilialExit(Sender: TObject);
    procedure ME1Exit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    FIncluindo : Boolean;
    Property pIncluindo : Boolean read FIncluindo write FIncluindo default False;
  public
    { Public declarations }
  end;

var
  FSaldoContabilCad: TFSaldoContabilCad;

implementation

uses UPlanilha_cl, USaldoContabilCons, UFilialCons, UPlanoContaCons,
  UFilial_cl, UPlanoConta_cl, UParamSistema_cl, UOracle_cl, UBiblioteca,
  UUsuario_cl;

{$R *.DFM}

procedure TFSaldoContabilCad.FormActivate(Sender: TObject);
begin
  inherited;
  With DMPlanoConta do
  Begin
    QPlanoConta.Open;
    Case Round(DMParamSistema.QParamSistemaNum_Graus_Contabil.Value) Of
       4: MENumConta.EditMask := '#.##.##.######;0;';
       5: MENumConta.EditMask := '#.##.##.##.######;0;';
       6: MENumConta.EditMask := '#.##.##.##.##.######;0;';
    End;
  End;
  DMPlanilha.QSaldoContabil.Open;
  MELocaliza.Visible:=False;
  SBIncluir.Visible:=False;
  SBAlterar.Visible:=False;
  SBExcluir.Visible:=False;
  SBConfirmar.Visible:=False;
  SBCancelar.Visible:=False;
  SBRefresh.Visible:=False;
end;

procedure TFSaldoContabilCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FSaldoContabilCons = Nil then
    FSaldoContabilCons:=TFSaldoContabilCons.Create(Application);
  FSaldoContabilCons.ShowModal; {= MrOk then}
  FSaldoContabilCons.Release;
  FSaldoContabilCons:=Nil;
end;

procedure TFSaldoContabilCad.BtFilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons=Nil then
    FFilialCons:=TFFilialCons.Create(Application);
  if FFilialCons.ShowModal=mrOk then
    DMPlanilha.QSaldoContabilCod_Filial.Value:=DMFilial.QFilialConsCod_Filial.Value;
end;

procedure TFSaldoContabilCad.BtPlanoContaClick(Sender: TObject);
begin
  inherited;
  if FPlanoContaCons=Nil then
    FPlanoContaCons:=TFPlanoContaCons.Create(Application);
  FPlanoContaCons.MECodFilial.Text:=FloatToStr(DMPlanilha.QSaldoContabilCod_Filial.Value);
  FPlanoContaCons.MECodFilial.ParentColor:=True;
  FPlanoContaCons.MECodFilial.ReadOnly:=True;
  if FPlanoContaCons.ShowModal=mrOk then
    DMPlanilha.QSaldoContabilCod_Plano_conta.Value:=DMPlanoConta.QPlanoContaConsCod_Plano_Conta.Value;
  FPlanoContaCons.MECodFilial.Clear;
  FPlanoContaCons.MECodFilial.Color:=clWindow;
  FPlanoContaCons.MECodFilial.ReadOnly:=False;
end;

procedure TFSaldoContabilCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  if DSPrimario.State in [DSInsert,DSEdit]  then
    Begin
//      BtFilial.Enabled:=True;
//      BtPlanoConta.Enabled:=True;
//      MENumConta.ReadOnly:=False;
//      MECodReduzido.ReadOnly:=False;
    end
  else
    begin
//      BtFilial.Enabled:=False;
//      BtPlanoConta.Enabled:=False;
//      MENumConta.ReadOnly:=True;
//      MECodReduzido.ReadOnly:=True;
    end;
end;

procedure TFSaldoContabilCad.MENumContaExit(Sender: TObject);
var
   vTestaNulo:String;
begin
  inherited;
   if ((Trim(Bib.LimpaString(MENumConta.Text,'.')))<>'') and (Trim(MECodFilial.Text)<>'') then
     begin
       vTestaNulo:=DMOracle.BuscaNome('SELECT COD_PLANO_CONTA FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+CHR(39)+Bib.LimpaString(MENumConta.Text,'.')+CHR(39));
       if vTestaNulo<>''  then
         begin
           ME1.Text:=DMOracle.BuscaNome('SELECT COD_REDUZIDO FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+CHR(39)+Bib.LimpaString(MENumConta.Text,'.')+CHR(39));
           MEDescConta.Text:=DMOracle.BuscaNome('SELECT Desc_PLANO_CONTA FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+CHR(39)+Bib.LimpaString(MENumConta.Text,'.')+CHR(39));
         end
       else
         begin
           MEDescConta.Clear;
           ME1.Clear;
         end;
     end
   else
     begin
       MEDescConta.Clear;
       ME1.Clear;
     end;
end;

procedure TFSaldoContabilCad.DSPrimarioDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
//  MENumConta.Text:=DMOracle.BuscaNome('SELECT NUM_PLANO_CONTA FROM TB_PLANO_CONTA','COD_PLANO_CONTA = '+FloatToStr(DMPlanilha.QSaldoContabilCod_Plano_Conta.Value));
//  MECodReduzido.Text:=DMOracle.BuscaNome('SELECT COD_REDUZIDO FROM TB_PLANO_CONTA','COD_PLANO_CONTA = '+FloatToStr(DMPlanilha.QSaldoContabilCod_Plano_Conta.Value));
end;

procedure TFSaldoContabilCad.SBIncluirClick(Sender: TObject);
begin
  inherited;
  pIncluindo:=True;
end;

procedure TFSaldoContabilCad.SBConfirmarClick(Sender: TObject);
begin
  inherited;
  if (pIncluindo = True) and (DMPlanilha.QSaldoContabilCOD_PLANO_CONTA.Value > 0) then
    begin
{      S:=FloattoStr(DMPlanilha.QSaldoContabilDT_ANO_MES.value);
      S1:=copy(S,1,4);
      S2:=copy(S,4,2);
      S:='01/'+S2+'/'+S1;
      D:=StrToDate(S);
      Try
        DMPlanilha.AtzSaldoContabil('D',DMPlanilha.QSaldoContabilCod_filial.Value,
                                     DMPlanilha.QSaldoContabilCod_Plano_Conta.Value,
                                     DMPlanilha.QSaldoContabilVal_Debito.Value,
                                     D);
        DMPlanilha.AtzSaldoContabil('C',DMPlanilha.QSaldoContabilCod_filial.Value,
                                     DMPlanilha.QSaldoContabilCod_Plano_Conta.Value,
                                     DMPlanilha.QSaldoContabilVal_Credito.Value,
                                     D)
      except
      end;  }
      pIncluindo:=False;
    end;
end;

procedure TFSaldoContabilCad.SBCancelarClick(Sender: TObject);
begin
  inherited;
  pIncluindo:=False;
end;

procedure TFSaldoContabilCad.MECodFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(MECodFilial.Text) <>'' then
  MEFilial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+MECodFilial.Text);
end;

procedure TFSaldoContabilCad.ME1Exit(Sender: TObject);
var
  vTestaNulo:String;
begin
  inherited;
   if (Trim(ME1.Text)<>'') and (Trim(MECodFilial.Text)<>'') then
     begin
       vTestaNulo:=DMOracle.BuscaNome('SELECT COD_PLANO_CONTA FROM TB_PLANO_CONTA','COD_REDUZIDO = '+ME1.Text);
       if vTestaNulo<>'' then
         begin
          MENumConta.Text:=DMOracle.BuscaNome('SELECT NUM_PLANO_CONTA FROM TB_PLANO_CONTA','COD_REDUZIDO = '+ME1.Text);
          MEDescConta.Text:=DMOracle.BuscaNome('SELECT Desc_PLANO_CONTA FROM TB_PLANO_CONTA','COD_REDUZIDO = '+ME1.Text);
         end
       else
         MEDescConta.Clear;
     end
   else
     begin
{       DMPlanilha.QSaldoContabilCod_Plano_Conta.Clear;
       MENumConta.Clear;}
     end;
end;


procedure TFSaldoContabilCad.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  if FFilialCons=Nil then
    FFilialCons:=TFFilialCons.Create(Application);
  if FFilialCons.ShowModal=mrOk then
    MECodFilial.Text:=FloatToStr(DMFilial.QFilialConsCod_Filial.Value);
end;

procedure TFSaldoContabilCad.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if FPlanoContaCons=Nil then
    FPlanoContaCons:=TFPlanoContaCons.Create(Application);
  FPlanoContaCons.MECodFilial.Text:=MECodFilial.text;
  FPlanoContaCons.MECodFilial.ParentColor:=True;
  FPlanoContaCons.MECodFilial.ReadOnly:=True;
  if FPlanoContaCons.ShowModal=mrOk then
    begin
      if DMPlanoConta.QPlanoContaConsCod_Reduzido.Value>0 then
        begin
          ME1.text:=FloatTOStr(DMPlanoConta.QPlanoContaConsCod_Reduzido.Value);
          ME1Exit(Self);
        end
      else
        begin
          MENumConta.Text:=DMPlanoConta.QPlanoContaConsNUM_PLANO_CONTA.Value;
          MENumContaExit(Self);
        end;
    end;
  FPlanoContaCons.MECodFilial.Clear;
  FPlanoContaCons.MECodFilial.Color:=clWindow;
  FPlanoContaCons.MECodFilial.ReadOnly:=False;
end;

procedure TFSaldoContabilCad.BitBtn1Click(Sender: TObject);
begin
  DmUsuario.Checar_Filial_Usuario( Trim(MECodFilial.Text),'CONTABIL');
  inherited;
  DMPlanilha.ImplantaSaldo('I',
                           StrToInt(MECodFilial.text),
                           MENumConta.text,
                           StrToFloat(MESaldoAnterior.text),
                           StrToFloat(MESaldoAtual.text),
                           StrToFloat(MEData.text));
  MECodFilial.Clear;
  ME1.Clear;
  MENumConta.Clear;
  MEData.Clear;
  MESaldoAnterior.Clear;
  MESaldoAtual.Clear;
  MEFilial.Clear;
  MEDescConta.Clear;
end;

procedure TFSaldoContabilCad.BitBtn2Click(Sender: TObject);
begin
  inherited;
  DMPlanilha.ImplantaSaldo('E',
                           StrToInt(MECodFilial.text),
                           MENumConta.text,
                           0,
                           0,
                           StrToFloat(MEData.text));
  MECodFilial.Clear;
  ME1.Clear;
  MENumConta.Clear;
  MEData.Clear;
  MESaldoAnterior.Clear;
  MESaldoAtual.Clear;
  MEFilial.Clear;
  MEDescConta.Clear;
end;

procedure TFSaldoContabilCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.Helpcontext(15);
end;

procedure TFSaldoContabilCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMPlanilha.QSaldoContabil.Close;
  DMPlanoConta.QPlanoConta.Close;
  Action := CaFree;
  FSaldoContabilCad := Nil;
end;

procedure TFSaldoContabilCad.Button1Click(Sender: TObject);
const
   xlCellTypeLastCell = $0000000B;
var
   XLSAplicacao, AbaXLS: OLEVariant;
   maxLinha, maxColuna, i : Integer;
   wCodReduzido, wCodigoConta, wCaminhoArquivo: string;
begin
//  inherited;
//  Result := False;
   // Cria Excel- OLE Object
   XLSAplicacao := CreateOleObject('Excel.Application');
   with DMOracle, DMPlanilha do
   begin
    try
    if (ODImportaXLS.Execute) then
    begin
      wCaminhoArquivo := ExtractFilePath(ODImportaXLS.FileName) +  ExtractFileName(ODImportaXLS.FileName);
      // Esconde Excel
        XLSAplicacao.Visible := False;
        // Abre o Workbook
        XLSAplicacao.Workbooks.Open(wCaminhoArquivo);

        {Selecione aqui a aba que você deseja abrir primeiro - 1,2,3,4....}
        XLSAplicacao.WorkSheets[1].Activate;
        {Selecione aqui a aba que você deseja ativar - começando sempre no 1 (1,2,3,4) }
        AbaXLS := XLSAplicacao.Workbooks[ExtractFileName(wCaminhoArquivo)].WorkSheets[1];

        AbaXLS.Cells.SpecialCells(xlCellTypeLastCell, EmptyParam).Activate;
        // Pegar o número da última linha
        maxLinha := XLSAplicacao.ActiveCell.Row - 1;
        // Pegar o número da última coluna
        maxColuna := XLSAplicacao.ActiveCell.Column;

        for i:= 2 to maxLinha do
        begin
          // Associaca a variant WorkSheet com a variant do Delphi
        //RangeMatrix := XLSAplicacao.Range['A1', XLSAplicacao.Cells.Item[x, y]].Value;
          wCodReduzido := XLSAplicacao.Cells.Item[i, 4].Value;
          wCodigoConta := DmOracle.FastSelect('COD_PLANO_CONTA', 'TB_PLANO_CONTA', 'COD_REDUZIDO = '+ Trim(wCodReduzido));
          if wCodigoConta <> '' then
          begin
            QImportaSaldo.Close;
            QImportaSaldo.Open;
            QImportaSaldo.Insert;
            QImportaSaldoCOD_FILIAL.Value := 1;
            QImportaSaldoCOD_PLANO_CONTA.Value := StrToInt(wCodigoConta);
            QImportaSaldoDT_ANO_MES.Value := 202012;
            QImportaSaldoVAL_ANTERIOR.Value:= 0;//XLSAplicacao.Cells.Item[i, 7].Value;
            QImportaSaldoVAL_DEBITO.Value  := 0;//XLSAplicacao.Cells.Item[i, 9].Value;
            QImportaSaldoVAL_CREDITO.Value := 0;///XLSAplicacao.Cells.Item[i, 10].Value;
            QImportaSaldoVAL_ATUAL.Value   := XLSAplicacao.Cells.Item[i, 11].Value;
            QImportaSaldo.Post;
          end;
        end;


     end;
      finally
          // Fecha o Microsoft Excel
          if not VarIsEmpty(XLSAplicacao) then
          begin
                XLSAplicacao.Workbooks.Close;
                XLSAplicacao.Quit;
                AbaXLS := Unassigned;
                XLSAplicacao := Unassigned;
          end;
      end;
    end;
end;

end.
