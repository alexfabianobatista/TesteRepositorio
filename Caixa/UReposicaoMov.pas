unit UReposicaoMov;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, DBDirceu, variants;

type
  TFReposicaoMov = class(TFTCadSimples)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    SBFilialCad: TSpeedButton;
    SBPromotorCad: TSpeedButton;
    SBHistoricoCad: TSpeedButton;
    DBDirceu1: TDBDirceu;
    DBDirceu2: TDBDirceu;
    DBDirceu3: TDBDirceu;
    MovimentoporPerodo1: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure SBFilialCadClick(Sender: TObject);
    procedure SBPromotorCadClick(Sender: TObject);
    procedure SBHistoricoCadClick(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure MovimentoporPerodo1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FReposicaoMov: TFReposicaoMov;

implementation

uses UPromoto_cl, UReposicaoMovCons, UFilialCons, UPromotorCons,
  UHistoricoPromotorCons, UHistoricoPromotor_cl, UFilial_cl, UPromotorParam,
  URReposicaoMov;

{$R *.DFM}

procedure TFReposicaoMov.FormActivate(Sender: TObject);
begin
  inherited;
  DMPromotor.QReposicaoMov.open;
end;

procedure TFReposicaoMov.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FReposicaoMovCons = Nil then
    FReposicaoMovCons:= TFReposicaoMovCons.Create(Application);
  If FReposicaoMovCons.Showmodal = mrOk then
  With DMPromotor do
  Begin
    QReposicaoMov.Close;
    QReposicaoMov.SetVariable('PK', QReposicaoMovConsCod_Reposicao_Mov.Value);
    QReposicaoMov.Open;
  End;

end;

procedure TFReposicaoMov.SBFilialCadClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
    DMPromotor.QReposicaoMovCod_Filial.Value := DMFilial.QFilialConsCod_Filial.Value;
end;

procedure TFReposicaoMov.SBPromotorCadClick(Sender: TObject);
begin
  inherited;
  If FPromotorCons = Nil then
    FPromotorCons := TFPromotorCons.Create(Application);
  If FPromotorCons.ShowModal = mrOk then
    DMPromotor.QReposicaoMovCod_Promotor.Value := DMPromotor.QPromotorConsCod_Promotor.Value;
end;

procedure TFReposicaoMov.SBHistoricoCadClick(Sender: TObject);
begin
  inherited;
  If FHistoricoPromotorCons = Nil then
    FHistoricoPromotorCons := TFHistoricoPromotorCons.Create(Application);
  If FHistoricoPromotorCons.ShowModal = mrOk then
    DMPromotor.QReposicaoMovCod_Historico_Promotor.Value := DMHistoricoPromotor.QHistoricoPromotorConsCod_Historico_Promotor.Value;

end;

procedure TFReposicaoMov.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  If DSPrimario.State in [DSInsert,DSEdit] then
    begin
      SBFilialCad.Enabled:=True;
      SBHistoricoCad.Enabled:=True;
      SBPromotorCad.Enabled:=True;
    end
  Else
    begin
      SBFilialCad.Enabled:=False;
      SBHistoricoCad.Enabled:=False;
      SBPromotorCad.Enabled:=False;
    end;
end;

procedure TFReposicaoMov.MovimentoporPerodo1Click(Sender: TObject);
begin
  inherited;
   If(FPromotorParam = nil)Then
    FPromotorParam := TFPromotorParam.Create(Application);
  FPromotorParam.PGRelatorio.Pages[3].TabVisible := True;
  if FPromotorParam.ShowModal = mrOk then
  begin
    With DMPromotor do
    Begin
      QRReposicaoMov.Close;
      if FPromotorParam.Me4Filial.Text <> '      ' then
        QRReposicaoMov.SetVariable('FILIAL',FPromotorParam.ME4Filial.Text)
      else
        QRReposicaoMov.SetVariable('FILIAL',null);

      if FPromotorParam.Me4Promotor.Text <> '      ' then
        QRReposicaoMov.SetVariable('PROMOTOR',FPromotorParam.ME4Promotor.Text)
      else
        QRReposicaoMov.SetVariable('PROMOTOR',null);

      if FPromotorParam.Me4Historico.Text <> '      ' then
        QRReposicaoMov.SetVariable('HISTORICO',FPromotorParam.ME4Historico.Text)
      else
        QRReposicaoMov.SetVariable('HISTORICO',null);

      if FPromotorParam.ME4DtInicial.Text = '' then
        QRReposicaoMov.SetVariable('DT_INICIAL',NULL)
      else
        QRReposicaoMov.SetVariable('DT_INICIAL',FPromotorParam.ME4DtInicial.Text);

      if FPromotorParam.ME4DtFinal.Text = '' then
        QRReposicaoMov.SetVariable('DT_FINAL',NULL)
      else
        QRReposicaoMov.SetVariable('DT_FINAL',FPromotorParam.ME4DtFinal.Text);

      QRReposicaoMov.Open;

      If FRReposicaoMov = Nil then
        FRReposicaoMov := TFRReposicaoMov.Create(Application);        
      FRReposicaoMov.QRLPeriodo.Caption := 'Histórico: '+ FPromotorParam.Ed4Historico.Text + ' -  Período: ' +
                                          FPromotorParam.ME4DtInicial.Text   + ' Até ' +FPromotorParam.ME4DtFinal.Text;

      If FPromotorParam.RGPreview.ItemIndex=0 then
        FRReposicaoMov.QRPrimario.Preview
      Else
        FRReposicaoMov.QRPrimario.Print;
      QRReposicaoMov.Close;
    End;
  end;

end;

end.
