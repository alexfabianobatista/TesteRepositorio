unit UPlanoContaAntigoCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, StdCtrls, ExtCtrls, Menus, DB, Grids, DBGrids, Mask,
  Buttons;

type
  TFPlanoContaAntigoCons = class(TFTConsulta)
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    MECodFilial: TMaskEdit;
    MEDescFilial: TMaskEdit;
    BitBtn1: TBitBtn;
    MeReduzido: TMaskEdit;
    MeNumConta: TMaskEdit;
    RgLiberado: TRadioGroup;
    procedure BtProcurarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPlanoContaAntigoCons: TFPlanoContaAntigoCons;

implementation

uses UPlanoConta_cl, UParamSistema_cl, UFilialCons, UFilial_cl;

{$R *.dfm}

procedure TFPlanoContaAntigoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMPlanoConta do
  Begin
    QPlanoContaAntigoCons.Close;
    QPlanoContaAntigoCons.Sql.Clear;
    QPlanoContaAntigoCons.Sql.Add('SELECT COD_REDUZIDO,COD_FILIAL,DESC_PLANO_CONTA,NUM_GRAU,NUM_PLANO_CONTA,COD_PLANO_CONTA_ANTIGO,IND_LIBERADO_USO ');
    QPlanoContaAntigoCons.Sql.Add('FROM TB_PLANO_CONTA_ANTIGO WHERE ');
    If Trim(MEReduzido.Text) <> '' then
     Begin
       QPlanoContaAntigoCons.Sql.Add('COD_REDUZIDO = ' + MEReduzido.Text);
       Case RGLiberado.ItemIndex Of
         0 : QPlanoContaAntigoCons.Sql.Add(' AND IND_LIBERADO_USO = ' + QuoteDStr('SIM'));
         1 : QPlanoContaAntigoCons.Sql.Add(' AND IND_LIBERADO_USO = ' + QuoteDStr('NAO'));
       End;
     End
    else
      if Trim(MENumConta.Text) <> '' then
       Begin
         QPlanoContaAntigoCons.Sql.Add('NUM_PLANO_CONTA >= ' + chr(39) + Trim(MENumConta.Text) + chr(39));
         Case RGLiberado.ItemIndex Of
           0 : QPlanoContaAntigoCons.Sql.Add(' AND IND_LIBERADO_USO = ' + QuoteDStr('SIM'));
           1 : QPlanoContaAntigoCons.Sql.Add(' AND IND_LIBERADO_USO = ' + QuoteDStr('NAO'));
         End;
         QPlanoContaAntigoCons.Sql.Add(' order by NUM_PLANO_CONTA');
       End
      else
        If Trim(METexto.Text) <> '' Then
         Begin
           If DmParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO' Then
             QPlanoContaAntigoCons.Sql.Add('UPPER(DESC_PLANO_CONTA) >= ' + chr(39) + UPPERCASE(Trim(METexto.Text)) + chr(39))
           Else
           QPlanoContaAntigoCons.Sql.Add('DESC_PLANO_CONTA >= ' + chr(39) + Trim(METexto.Text) + chr(39));
           Case RGLiberado.ItemIndex Of
             0 : QPlanoContaAntigoCons.Sql.Add(' AND IND_LIBERADO_USO = ' + QuoteDStr('SIM'));
             1 : QPlanoContaAntigoCons.Sql.Add(' AND IND_LIBERADO_USO = ' + QuoteDStr('NAO'));
           End;
           QPlanoContaAntigoCons.Sql.Add(' Order by DESC_PLANO_CONTA');
         End;
    QPlanoContaAntigoCons.Open;
  End;

end;

procedure TFPlanoContaAntigoCons.BitBtn1Click(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal=mrOk then
    MeCodFilial.Text:=FloatToStr(DMFilial.QFilialConsCod_Filial.Value);
end;

end.
