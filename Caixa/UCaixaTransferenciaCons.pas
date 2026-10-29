unit UCaixaTransferenciaCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, ExtCtrls, variants;

type
  TFCaixaTransferenciaCons = class(TFTConsulta)
    Label2: TLabel;
    MeFilialRecebe: TMaskEdit;
    BtFilialCons: TSpeedButton;
    SpeedButton1: TSpeedButton;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    MeDtLancamento: TMaskEdit;
    Label4: TLabel;
    MeDtLancFinal: TMaskEdit;
    RgSituacao: TRadioGroup;
    procedure BtFilialConsClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCaixaTransferenciaCons: TFCaixaTransferenciaCons;

implementation

uses UCaixa_Transf_cl, UFilialCons, UFilial_cl;

{$R *.DFM}

procedure TFCaixaTransferenciaCons.BtFilialConsClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal=MrOk then
     MeTexto.Text:=DMFilial.QFilialConsCod_Filial.Text;

end;

procedure TFCaixaTransferenciaCons.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal=MrOk then
     MeFilialRecebe.Text:=DMFilial.QFilialConsCod_Filial.Text;
end;

procedure TFCaixaTransferenciaCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMCaixa_Transf do
  Begin
    QCaixaTransCab_Cons.Close;
    If Trim(MeTexto.Text) <> '' Then
       QCaixaTransCab_Cons.SetVariable('Cod_Filial_Remetente',Trim(MeTexto.Text))
    Else
       QCaixaTransCab_Cons.SetVariable('Cod_Filial_Remetente',Null);

    If Trim(MeFilialRecebe.Text) <> '' Then
       QCaixaTransCab_Cons.SetVariable('Cod_Filial_Recebe',Trim(MeFilialRecebe.Text))
    Else
       QCaixaTransCab_Cons.SetVariable('Cod_Filial_Recebe',Null);
    Case RgSituacao.ItemIndex of
      0 : QCaixaTransCab_Cons.SetVariable('Ind_Situacao','1');
      1 : QCaixaTransCab_Cons.SetVariable('Ind_Situacao','2');
      2 : QCaixaTransCab_Cons.SetVariable('Ind_Situacao',Null);
    End;  
    QCaixaTransCab_Cons.SetVariable('Dt_Lancamento',MeDtLancamento.Text);
    QCaixaTransCab_Cons.SetVariable('Dt_Lancamento_Final',MeDtLancFinal.Text);
    QCaixaTransCab_Cons.Open;
  End;
end;

procedure TFCaixaTransferenciaCons.FormActivate(Sender: TObject);
begin
  inherited;
  MeDtLancamento.Text := DateToStr(Date);
  MeDtLancFinal.Text := DateToStr(Date);
end;
                                     
end.
