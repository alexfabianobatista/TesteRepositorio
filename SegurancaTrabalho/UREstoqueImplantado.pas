unit UREstoqueImplantado;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls, ComCtrls, ToolWin,
  StdCtrls, qrpREV;

type
  TFREstoqueImplantado = class(TFTRelSimples)
    QRLFilial: TQRLabel;
    QRGroup1: TQRGroup;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRGroup2: TQRGroup;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRShape1: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRExpr1: TQRExpr;
    procedure DesabilitaBotoesImpressao(hd : boolean);
    procedure QRPrimarioStartPage(Sender: TCustomQuickRep);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FREstoqueImplantado: TFREstoqueImplantado;

implementation

uses UEstoqueSeguranca_cl, UParamSistema_cl;

{$R *.DFM}


procedure TFREstoqueImplantado.DesabilitaBotoesImpressao(hd : boolean);
var
 tBar, tPrev, tFin: TComponent;
 i: integer;
 PrevFrm: TForm;

 X, y : TToolButton;
begin
  //Pega o Form do Preview Ativo
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'AB' then
  begin
    PrevFrm := nil;
    for i := 0 to Screen.FormCount-1 do
      with Screen.Forms[i] do
        if ClassName = 'TQRStandardPreview' then
          PrevFrm := Screen.Forms[i];

    // Se não encontrou o Form, abandona
    if PrevFrm <> nil then
    begin
      // Botão printsetup do setup do Preview
      tBar := PrevFrm.FindComponent('PrintSetup');
      if tBar <> nil then
      begin
        TFin := Nil;
        tFin := PrevFrm.FindComponent('btnSetupXXX');
        if tFin = nil then
        begin
          x := nil;
          x := TToolButton.create(PrevFrm);

          x.Parent := TQRStandardPreview(PrevFrm).ToolBar1;
          x.OnClick := TQRStandardPreview(PrevFrm).PrintSetupClick;
          x.ImageIndex := 7;
          x.Left := 216;
          x.name := 'btnSetupXXX';

          TToolButton(PrevFrm.FindComponent('PrintSetup')).ImageIndex := 7;
          TToolButton(PrevFrm.FindComponent('PrintSetup')).OnClick := TQRStandardPreview(PrevFrm).PrintSetupClick;
          //TToolButton(PrevFrm.FindComponent('PrintSetup')).Visible := false;
          //TToolButton(PrevFrm.FindComponent('PrintSetup')).Enabled := false;//hd;
          //TToolButton(PrevFrm.FindComponent('PrintSetup')).Visible := false;//hd;
        end;
      end;

      // Botão print do imprimir do Preview
      tBar := PrevFrm.FindComponent('Print');
      if tBar <> nil then
      begin
        tFin := nil;
        tFin := PrevFrm.FindComponent('btnImprimirXXX');
        if tFin = nil then
        begin
          y := nil;
          y := TToolButton.create(PrevFrm);

          y.Parent := TQRStandardPreview(PrevFrm).ToolBar1;
          y.OnClick := TQRStandardPreview(PrevFrm).PrintClick;
          y.ImageIndex := 8;
          y.Left := 258;
          y.name := 'btnImprimirXXX';

          TToolButton(PrevFrm.FindComponent('Print')).ImageIndex := 8;
          TToolButton(PrevFrm.FindComponent('Print')).OnClick := TQRStandardPreview(PrevFrm).PrintClick;
          //TToolButton(PrevFrm.FindComponent('Print')).Visible := false;

        end;
      end;
      // Botão loadreport do Preview
      tBar := PrevFrm.FindComponent('LoadReport');
      if tBar <> nil then
      begin
        TToolButton(tBar).Enabled := hd;
        //TToolButton(tBar).Visible := hd;
      end;
      //Botão loadreport do Preview
      tBar := PrevFrm.FindComponent('SaveReport');
      if tBar <> nil then
      begin
        TToolButton(tBar).Enabled := hd;
        //TToolButton(tBar).Visible := hd;
      end;
    end;
  end;
end;


procedure TFREstoqueImplantado.QRPrimarioStartPage(
  Sender: TCustomQuickRep);
begin
  inherited;
  //DesabilitaBotoesImpressao(true);
end;

end.
