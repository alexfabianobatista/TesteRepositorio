unit UBalancaCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, ExtCtrls, variants,
  Menus;

type
  TFBalancaCons = class(TFTConsulta)
    Label2: TLabel;
    MeDtReferencia: TMaskEdit;
    Rgsituacao: TRadioGroup;
    Label3: TLabel;
    MEDesc_placa: TMaskEdit;
    CbTipoPesagem: TComboBox;
    Label4: TLabel;
    procedure BtProcurarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FBalancaCons: TFBalancaCons;

implementation

uses URomaneioAgricola_cl, UUsuario_cl, UParamSistema_cl;

{$R *.DFM}

procedure TFBalancaCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DmRomaneioAgricola do
  Begin
    QBalancaCons.Close;
    If Trim(MeTexto.Text) <> '' Then
       QBalancaCons.SetVariable('Cod_Filial',StrToInt(Trim(MeTexto.Text)))
    Else
       QBalancaCons.SetVariable('Cod_Filial',Null);

    If Trim(MeDtReferencia.Text) <> '' Then
       QBalancaCons.SetVariable('Dt_Referencia',StrToDate(MeDtReferencia.Text))
    Else
       QBalancaCons.SetVariable('Dt_Referencia',Null);
    Case RgSituacao.ItemIndex Of
      0: QBalancaCons.SetVariable('Ind_Situacao','A');
      1: QBalancaCons.SetVariable('Ind_Situacao','F');
      2: QBalancaCons.SetVariable('Ind_Situacao',Null);
    End;
    If CbTipoPesagem.ItemIndex = 4 Then
       QBalancaCons.SetVariable('Ind_Tipo',Null)
    Else
       QBalancaCons.SetVariable('Ind_Tipo',CbTipoPesagem.Items[CbTipoPesagem.ItemIndex]);
    If Trim(MEDesc_placa.Text) <> '' Then
       QBalancaCons.SetVariable('MEDESC_PLACA',Trim(MEDesc_placa.Text))
    Else
       QBalancaCons.SetVariable('MEDESC_PLACA',Null);
    QBalancaCons.Open;
  end;
end;

procedure TFBalancaCons.FormActivate(Sender: TObject);
begin
  inherited;
  MeTexto.Text := FloatToStr(DMUsuario.CodFilialUsuario);
  MeDtReferencia.Text := DateToStr(Date);
  if dmparamsistema.qparamsistemaCOD_EMPRESA.Text =  'CEREAIS' then
    MeDtReferencia.Text := DateToStr(Date - 3);
end;

end.
