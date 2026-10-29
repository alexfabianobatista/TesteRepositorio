unit USaldoContabilCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants, Menus;

type
  TFSaldoContabilCons = class(TFTConsulta)
    MEFilial: TMaskEdit;
    MECodPlanoConta: TMaskEdit;
    BtFilial: TBitBtn;
    BitBtn2: TBitBtn;
    MEPlanoConta: TMaskEdit;
    Label2: TLabel;
    MEDtAnoMes: TMaskEdit;
    Label3: TLabel;
    procedure BtProcurarClick(Sender: TObject);
    procedure BtFilialClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure METextoChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure MECodPlanoContaExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSaldoContabilCons: TFSaldoContabilCons;

implementation

uses UPlanilha_cl, UFilialCons, UFilial_cl, UPlanoContaCons,
     UBiblioteca, UOracle_cl, UPlanoConta_cl, UParamSistema_cl, UUsuario_cl;

{$R *.DFM}

procedure TFSaldoContabilCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  DmUsuario.Checar_Filial_Usuario( Trim(METexto.Text),'CONTABIL');
  with DMPlanilha do
    begin
      QSaldoContabilCons.Close;
      if Trim(MEtexto.Text) <>'' then
        QSaldoContabilCons.SetVariable('COD_FILIAL',StrToInt(Trim(METexto.Text)))
      else
        QSaldoContabilCons.SetVariable('COD_FILIAL',Null);

      if Trim(MECodPlanoConta.Text) <>'' then
        QSaldoContabilCons.SetVariable('NUM_PLANO_CONTA',Trim(MECodPlanoConta.Text))
      else
        QSaldoContabilCons.SetVariable('NUM_PLANO_CONTA',Null);

      if Trim(Bib.LimpaString(MEDtAnoMes.Text,'/')) = '' then
        Raise Exception.Create ('Informar Período Ano/Mês');
      QSaldoContabilCons.SetVariable('DT_ANO_MES',StrToInt(Bib.LimpaString(MEDtAnoMes.Text,'/')));

      QSaldoContabilCons.Open;
    end;
end;

procedure TFSaldoContabilCons.BtFilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons=Nil then
    FFilialCons:=TFFilialCons.Create(Application);
  if FFilialCons.ShowModal=mrOk then
    METexto.Text:=FloatToStr(DMFilial.QFilialConsCod_Filial.Value);
end;

procedure TFSaldoContabilCons.BitBtn2Click(Sender: TObject);
begin
  inherited;
  if FPlanoContaCons=Nil then
    FPlanoContaCons:=TFPlanoContaCons.Create(Application);
  FPlanoContaCons.MECodFilial.Text:=METexto.Text;
  if FPlanoContaCons.ShowModal=mrOk then
    begin
      MECodPlanoConta.Text:=(DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value);
      METexto.Text:=FloatToStr(DMPlanoConta.QPlanoContaConsCod_filial.Value);
      MECodPlanoContaExit(Self);
    end;
end;

procedure TFSaldoContabilCons.METextoChange(Sender: TObject);
begin
  inherited;
  if Trim(MEtexto.Text) <> '' then
    MEFilial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+(METexto.Text))
  else
    MEFilial.Clear;
end;

procedure TFSaldoContabilCons.FormActivate(Sender: TObject);
begin
  inherited;
  With DMPlanoConta do
  Begin
    QPlanoConta.Open;
    Case Round(DMParamSistema.QParamSistemaNum_Graus_Contabil.Value) Of
       4:begin
         MECodPlanoConta.EditMask := '#.##.##.######;0;';
         end;
       5:begin
         MECodPlanoConta.EditMask := '#.##.##.##.######;0;';
         end;
       6:begin
         MECodPlanoConta.EditMask := '#.##.##.##.##.######;0;';
         end;
    End;
{    If DMParamSistema.QParamSistemaIND_TIPO_PLANO_CONTA.Value='UNICO' then
      begin
        METexto.Text:='1';
        METexto.Enabled:=False;
        BtFilial.Enabled:=False;
      end; }
  End;
end;

procedure TFSaldoContabilCons.MECodPlanoContaExit(Sender: TObject);
begin
  inherited;
  if Trim(METexto.text)='' then
    begin
      if Trim(MECodPlanoConta.Text) <> '' then
        MEPlanoConta.Text:=DMOracle.BuscaNome('SELECT DESC_PLANO_CONTA FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+(MECodPlanoConta.Text))
      else
        MEPlanoConta.Clear;
    end
  else
    begin
      if Trim(MECodPlanoConta.Text) <> '' then
        MEPlanoConta.Text:=DMOracle.BuscaNome('SELECT DESC_PLANO_CONTA FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+(MECodPlanoConta.Text)+' AND COD_FILIAL = '+METexto.Text)
      else
        MEPlanoConta.Clear;
    end;
end;

end.
