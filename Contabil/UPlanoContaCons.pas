unit UPlanoContaCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Grids, DBGrids, StdCtrls, Mask, Buttons, Db, ExtCtrls, Menus;

type
  TFPlanoContaCons = class(TFTConsulta)
    MECodFilial: TMaskEdit;
    MEDescFilial: TMaskEdit;
    BitBtn1: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    MeReduzido: TMaskEdit;
    Label4: TLabel;
    MeNumConta: TMaskEdit;
    RgLiberado: TRadioGroup;
    procedure BtProcurarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure MECodFilialChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPlanoContaCons: TFPlanoContaCons;

implementation

uses UPlanoConta_cl, UFilialCons, UOracle_cl, UFilial_cl, UParamSistema_cl;

{$R *.DFM}

procedure TFPlanoContaCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMPlanoConta do
  Begin
    QPlanoContaCons.Close;
    QPlanoContaCons.Sql.Clear;
    QPlanoContaCons.Sql.Add('SELECT COD_REDUZIDO,COD_FILIAL,DESC_PLANO_CONTA,NUM_GRAU,NUM_PLANO_CONTA,COD_PLANO_CONTA,IND_LIBERADO_USO ');
    QPlanoContaCons.SQL.Add(',TB_PLANO_CONTA_REFERENCIAL.COD_PLANO_CONTA_REFERENCIAL || ' + QuotedStr( '-' ) + ' || TB_PLANO_CONTA_REFERENCIAL.DESC_PLANO_CONTA_REFERENCIAL AS DESC_PLANO_CONTA_REFERENCIAL');
    QPlanoContaCons.SQL.Add(',TB_PLANO_CONTA_REFERENCIAL.NUM_PLANO_CONTA_REFERENCIAL');
    QPlanoContaCons.Sql.Add(' FROM TB_PLANO_CONTA LEFT JOIN TB_PLANO_CONTA_REFERENCIAL ON TB_PLANO_CONTA_REFERENCIAL.COD_PLANO_CONTA_REFERENCIAL = TB_PLANO_CONTA.COD_PLANO_CONTA_REFERENCIAL');
    QPlanoContaCons.SQL.Add(' WHERE 1 = 1');
    If Trim(MEReduzido.Text) <> '' then
     Begin
       QPlanoContaCons.Sql.Add(' AND COD_REDUZIDO = ' + MEReduzido.Text);
       Case RGLiberado.ItemIndex Of
         0 : QPlanoContaCons.Sql.Add(' AND IND_LIBERADO_USO = ' + QuoteDStr('SIM'));
         1 : QPlanoContaCons.Sql.Add(' AND IND_LIBERADO_USO = ' + QuoteDStr('NAO'));
       End;
     End
    else
      if Trim(MENumConta.Text) <> '' then
       Begin
         QPlanoContaCons.Sql.Add(' AND NUM_PLANO_CONTA >= ' + chr(39) + Trim(MENumConta.Text) + chr(39));
         Case RGLiberado.ItemIndex Of
           0 : QPlanoContaCons.Sql.Add(' AND IND_LIBERADO_USO = ' + QuoteDStr('SIM'));
           1 : QPlanoContaCons.Sql.Add(' AND IND_LIBERADO_USO = ' + QuoteDStr('NAO'));
         End;
         QPlanoContaCons.Sql.Add(' order by NUM_PLANO_CONTA');
       End
      else
        If Trim(METexto.Text) <> '' Then
         Begin
           QPlanoContaCons.Sql.Add(' AND DESC_PLANO_CONTA LIKE ' +
              chr(39) + Trim(METexto.Text) +'%'+ chr(39));
           Case RGLiberado.ItemIndex Of
             0 : QPlanoContaCons.Sql.Add(' AND IND_LIBERADO_USO = ' + QuoteDStr('SIM'));
             1 : QPlanoContaCons.Sql.Add(' AND IND_LIBERADO_USO = ' + QuoteDStr('NAO'));
           End;
           QPlanoContaCons.Sql.Add(' Order by DESC_PLANO_CONTA');
         End;
    QPlanoContaCons.Open;
  End;
end;

procedure TFPlanoContaCons.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal=mrOk then
    MECodFilial.Text:=FloatToStr(DMFilial.QFilialConsCod_Filial.Value);
end;

procedure TFPlanoContaCons.MECodFilialChange(Sender: TObject);
begin
  inherited;
  if Trim(MECodFilial.Text)<>'' then
    MEDescFilial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+MECodFilial.Text,True)
  else
    MEDescFilial.Text:='Todos';
end;

procedure TFPlanoContaCons.FormActivate(Sender: TObject);
begin
  inherited;
    Case Round(DMParamSistema.QParamSistemaNum_Graus_Contabil.Value) Of
       4: MENumConta.EditMask := '#.##.##.######;0;';
       5: MENumConta.EditMask := '#.##.##.##.######;0;';
       6: MENumConta.EditMask := '#.##.##.##.##.######;0;';
    End;

end;

end.
